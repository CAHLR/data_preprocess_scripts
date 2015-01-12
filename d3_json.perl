#!/usr/bin/perl -w

use lib '/home/yanbox/perl5/lib/perl5';
# Usage: cat after_parse.data.csv|perl d3_json.perl json_file > d3_json_file
use JSON;
use JSON::Parse ':all';
use Data::Dumper;
use Text::CSV_XS;

$json_file = $ARGV[0];

#load subparts
my $csv = Text::CSV_XS->new({ sep_char => "," });
$line= <STDIN>;
while($line= <STDIN>){
	chomp $line;
	my $secs_to_next = "";
	my $actor = "";
	my $verb = "";
	my $verb_type = "";
	my $chapter = "";
	my $category = "";
	my $cat_type = "";
	my $json_id = "";
	my $obj_name = "";	
	my $name = "";
	my $result = "";
	my $subpart = "";
	my $answer = "";
	my $correctness = "";

	if(!$csv->parse($line)){next;}
	
	@tokens = $csv->fields();		
		
	$secs_to_next = $tokens[0];
	$actor = $tokens[1];
	$verb = $tokens[2];
	$verb_type = $tokens[3];
	$chapter = $tokens[4];
	$category = $tokens[5];
	$cat_type = $tokens[6];
	$json_id = $tokens[7];
	$subpart = $tokens[11];

	

	if($subpart eq ""){next;}
	if($json_id eq $subpart){next;}	

	@toks = split /-/,$subpart;
	$subpart = pop(@toks);
	if(@toks){
		$subpart = join "-", pop(@toks),$subpart;
	}

	$key = join "_",$json_id,$subpart;
	if(exists $HashP2Sub{$key}){next;}
	$HashP2Sub{$key} = 1;

	if(!exists $P2Sub->{$json_id}){
		$P2Sub->{$json_id}->[0]->{'name'} = $subpart;
	}else{
		$n = @{$P2Sub->{$json_id}};
		$P2Sub->{$json_id}->[$n]->{'name'} = $subpart;
	}
}

#load json
$num_chapter = 0;
my $structureHash = json_file_to_perl($json_file);

my $HashD3->{'name'} = 'course';
foreach $json_id(sort keys %$structureHash){
	if($structureHash->{$json_id}->{'category'} eq "chapter"){
		if(!exists $structureHash->{$json_id}->{'children'}){next;}
		$chapter = $structureHash->{$json_id}->{'metadata'}->{'display_name'};
		$HashD3->{'children'}->[$num_chapter]->{'name'} = $chapter;
		$children = $structureHash->{$json_id}->{'children'};
		my $i=0;
		foreach $child(@$children){
			if(!exists $structureHash->{$child}->{'metadata'}->{'display_name'}){next;}
			$name = $structureHash->{$child}->{'metadata'}->{'display_name'};
			$HashD3->{'children'}->[$num_chapter]->{'children'}->[$i]->{'name'} = $name;
			if(exists $structureHash->{$child}->{'children'}){
				$grandchildren = $structureHash->{$child}->{'children'};
				my $j=0;
				foreach $grandchild(@$grandchildren){
					if(!exists $structureHash->{$grandchild}->{'metadata'}->{'display_name'}){
						if(!exists $structureHash->{$grandchild}->{'children'}){next;}
						$childrenOfgrandchildren = $structureHash->{$grandchild}->{'children'};
						foreach $childrenOfgrandchild(@$childrenOfgrandchildren){
							if(!exists $structureHash->{$childrenOfgrandchild}->{'metadata'}->{'display_name'}){next;}
							$name = $structureHash->{$childrenOfgrandchild}->{'metadata'}->{'display_name'};
							$HashD3->{'children'}->[$num_chapter]->{'children'}->[$i]->{'children'}->[$j]->{'name'} = $name;
							if(exists $P2Sub->{$childrenOfgrandchild}){
								$HashD3->{'children'}->[$num_chapter]->{'children'}->[$i]->{'children'}->[$j]->{'children'} = $P2Sub->{$childrenOfgrandchild};
							}
							$j++;
						}
					}else{
						$name = $structureHash->{$grandchild}->{'metadata'}->{'display_name'};
						$HashD3->{'children'}->[$num_chapter]->{'children'}->[$i]->{'children'}->[$j]->{'name'} = $name;
						if(exists $P2Sub->{$grandchild}){
							$HashD3->{'children'}->[$num_chapter]->{'children'}->[$i]->{'children'}->[$j]->{'children'} = $P2Sub->{$grandchild};
						}

						if(exists $structureHash->{$grandchild}->{'children'}){
							$grandgrandchildren = $structureHash->{$grandchild}->{'children'};
							my $k=0;
							foreach $grandgrandchild(@$grandgrandchildren){
								if(!exists $structureHash->{$grandgrandchild}->{'metadata'}->{'display_name'}){next;}
								$name = $structureHash->{$grandgrandchild}->{'metadata'}->{'display_name'};
								$HashD3->{'children'}->[$num_chapter]->{'children'}->[$i]->{'children'}->[$j]->{'children'}->[$k]->{'name'} = $name;
								if(exists $P2Sub->{$grandgrandchild}){
									$HashD3->{'children'}->[$num_chapter]->{'children'}->[$i]->{'children'}->[$j]->{'children'}->[$k]->{'children'} = $P2Sub->{$grandgrandchild};
								}
								if(exists $structureHash->{$grandgrandchild}->{'children'}){
									$latestchildren = $structureHash->{$grandgrandchild}->{'children'};
									my $l=0;
									foreach $latestchild(@$latestchildren){
										if(!exists $structureHash->{$latestchild}->{'metadata'}->{'display_name'}){next;}
										$name = $structureHash->{$latestchild}->{'metadata'}->{'display_name'};
										$HashD3->{'children'}->[$num_chapter]->{'children'}->[$i]->{'children'}->[$j]->{'children'}->[$k]->{'children'}->[$l]->{'name'} = $name;
										if(exists $P2Sub->{$latestchild}){
											$HashD3->{'children'}->[$num_chapter]->{'children'}->[$i]->{'children'}->[$j]->{'children'}->[$k]->{'children'}->[$l]->{'children'} = $P2Sub->{$latestchild};
										}
										$l++;
									}
								}
								$k++;
							}
						}
						$j++;
					}
				}
			}
			$i++;
		}
		$num_chapter++;
	}
}

#print Dumper($HashD3);

my $d3_json = encode_json $HashD3;
print "$d3_json\n";
