#!/usr/bin/perl -w

use lib '/home/yanbox/perl5/lib/perl5';
use Text::CSV_XS;

#*****************************************
# ARGV options: tmp_data_dir, data_name, num_cv
#*****************************************
$num_args = $#ARGV + 1;
if($num_args < 2){
	die "\nUsage: cat after_parse_data|perl gen_splits.perl tmp_data_dir data_name (num_cv)\n";
}

$tmp_data_dir = $ARGV[0];
$data_name = $ARGV[1];

#*****************************************
# CV fold num
#*****************************************
my $NUM_CV = 5;

if($num_args == 3){
	$NUM_CV = $ARGV[2];
}

#*****************************************
# Outputs
# actor list: actor_id,fold_num
# num list: uniq values
#*****************************************
my $list = sprintf("%s/actor_splits.%s.txt",$tmp_data_dir,$data_name);
my $num_list = sprintf("%s/num_list.%s.txt",$tmp_data_dir,$data_name);

my $num_actor = 0;
my $num_subpart = 0;
my $num_problem = 0;
my $num_category = 0;
my $num_cat_type = 0;
my $num_chapter = 0;
my $num_verb = 0;
my $num_verb_type = 0;

#*****************************************
# Student group
# 1) currently all students
# 2) midway students?
# 3) students who complete?
#*****************************************
open(LIST,">$list ") or
	die "create output $list error!";

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

	if(!$csv->parse($line)){
		@tokens = split /,/,$line;
	}else{
		@tokens = $csv->fields();
	}		
		
	$secs_to_next = $tokens[0];
	$actor = $tokens[1];
	$verb = $tokens[2];
	$verb_type = $tokens[3];
	$chapter = $tokens[4];
	$category = $tokens[5];
	$cat_type = $tokens[6];
	$json_id = $tokens[7];
	$subpart = $tokens[11];

	if(!exists $HashActor{$actor}){
		$HashActor{$actor} = 1;
		print LIST "$actor,",int(rand($NUM_CV)) + 1,"\n";
		$num_actor++;
	}

	if(!exists $HashVerb{$verb}){
		$HashVerb{$verb} = 1;
		$num_verb++;
	}
	if(!exists $HashVerbType{$verb_type}){
		$HashVerbType{$verb_type} = 1;
		$num_verb_type++;
	}
	if($verb eq "problem_check"){
		if(!exists $HashSubpart{$subpart}){
			if($subpart ne ""){
				$HashSubpart{$subpart}=1;
				$num_subpart++;
			}
		}
		if(!exists $HashProblem{$json_id}){
			if($json_id ne ""){
				$HashProblem{$json_id}=1;
				$num_problem++;
			}
		}
		if(!exists $HashCat{$category}){
			$HashCat{$category} = 1;
			$num_category++;
		}
		if(!exists $HashCatType{$cat_type}){
			$HashCatType{$cat_type} = 1;
			$num_cat_type++;
		}
		if(!exists $HashChapter{$chapter}){
			$HashChapter{$chapter} = 1;
			$num_chapter++;
		}
	}	
}
close LIST;

open(NUM,">$num_list") or
	die "create output $num_list error!";
print NUM "$num_actor,$num_verb,$num_verb_type,$num_subpart,";
print NUM "$num_problem,$num_category,$num_cat_type,$num_chapter\n";
close NUM;
