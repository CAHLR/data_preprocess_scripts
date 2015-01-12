#!usr/bin/perl -w
use lib '/home/yanbox/perl5/lib/perl5';

use JSON::Parse ':all';
use Text::CSV_XS;
use Data::Dumper;

$SIG{__DIE__} = \&log_die;
$SIG{__WARN__} = \&log_warn;

#*****************************************
# ARGV options: tmp_data_dir, data_name, hmm_dir, 
#               kc_model, res_filter, res_granularity, res_prior_num,
#		(log_file)
#*****************************************
my $num_args = $#ARGV + 1;
if($num_args < 7){
	die "\nUsage: cat after_parse_data|perl convert_data.perl tmp_data_dir data_name ",
	"hmm_dir kc_model res_filter res_granularity res_prior_num (log_file)\n";
}

my $tmp_data_dir = $ARGV[0];
my $data_name = $ARGV[1];
my $hmm_dir = $ARGV[2];

my $KC_MODEL = $ARGV[3];
my $INC_RES = $ARGV[4];
my $RES = $ARGV[5];
my $RES_NUM = $ARGV[6];

my $logfile = "log.convert.txt";

if($num_args == 8){
	$logfile  = $ARGV[7];
}

open LOG, ">", $logfile;
close LOG;

#*****************************************
# Read inputs
# actor list: actor_id,fold_num
# num list: uniq values
#*****************************************
my $list = sprintf("%s/actor_splits.%s.txt",$tmp_data_dir,$data_name);
my $NUM_CV = 0;

# Read actor's fold
# @FoldOfActor: $FoldOfActor[$fold-1] = [actor1, actor2,...]
# %ActorToFold: actor -> fold num
open(LIST,"<$list ") or
	die "read input $list error!";
while($line = <LIST>){
	chomp $line;
	@tokens = split /,/,$line;
	my $actor = $tokens[0];
	my $fold = $tokens[1];
	push @{$FoldOfActor[$fold-1]},$actor;
	if($NUM_CV < $fold){$NUM_CV = $fold;}
}
close LIST;

#*****************************************
# Generate folders and names
#*****************************************
$DIR = sprintf("%s/+data/+%s",$hmm_dir,$data_name);
unless(-e $DIR or mkdir $DIR){
	die "Unable to create $DIR";
}

$DIR = sprintf("%s/+data/+%s/+%s",$hmm_dir,$data_name,$INC_RES);
unless(-e $DIR or mkdir $DIR){
	die "Unable to create $DIR";
}

if($INC_RES eq "no_res"){
	$DIR = sprintf("%s/+data/+%s/+%s/+%s",$hmm_dir,$data_name,$INC_RES,$KC_MODEL);
	unless(-e $DIR or mkdir $DIR){
		die "Unable to create $DIR";
	}
}else{	
	$DIR = sprintf("%s/+data/+%s/+%s/+%s",$hmm_dir,$data_name,$INC_RES,$RES_NUM);
	unless(-e $DIR or mkdir $DIR){
		die "Unable to create $DIR";
	}
	$DIR = sprintf("%s/+data/+%s/+%s/+%s/+%s",$hmm_dir,$data_name,$INC_RES,$RES_NUM, $RES);
	unless(-e $DIR or mkdir $DIR){
		die "Unable to create $DIR";
	}
	$DIR = sprintf("%s/+data/+%s/+%s/+%s/+%s/+%s",$hmm_dir,$data_name,$INC_RES,$RES_NUM, $RES,$KC_MODEL);
	unless(-e $DIR or mkdir $DIR){
		die "Unable to create $DIR";
	}
}
my $outNameKC = sprintf("%s/names.kc.dat",$DIR);
my $outNameRes = sprintf("%s/names.res.dat",$DIR);	 

#*****************************************
# Convert data
#*****************************************

open(RNAME,">$outNameRes") or
	die "creat output $outNameRes error!";
print RNAME "Resource\n";

my $csv = Text::CSV_XS->new({ sep_char => ',' });

$IdxResources{'problem_check'} = 1;
print RNAME "problem_check\n";

my $cnt_kc =0;
my $cnt_res = 1;

my %HashDataResult;
my %HashDataSubpart;
my %HashRes;
my %HashLen;

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

	my $kc = "";
	my $resource = "";
	my $res_type = "";

	if(!$csv->parse($line)){
		# warn "cannot parse csv, use split instead in line $.: $line.";
		@tokens = split /,/,$line;			
	}else{
		@tokens = $csv->fields();
		$json_id = $tokens[7];
		$obj_name = $tokens[8];	
		$name = $tokens[9];
		$result = $tokens[10];
		$subpart = $tokens[11];
		$answer = $tokens[12];
		$correctness = $tokens[13];
	}
	$secs_to_next = $tokens[0];
	$actor = $tokens[1];
	$verb = $tokens[2];
	$verb_type = $tokens[3];
	$chapter = $tokens[4];
	$category = $tokens[5];
	$cat_type = $tokens[6];

	$attempt = 0;
	$res = 0;
	
	#*****************************************
	# KC models
	#*****************************************
	if($KC_MODEL eq "subpart"){$kc = $subpart;}
	if($KC_MODEL eq "problem"){$kc = $json_id;}
	if($KC_MODEL eq "category"){$kc = $category;}
	if($KC_MODEL eq "cat_type"){$kc = $cat_type;}
	if($KC_MODEL eq "chapter"){$kc = $chapter;}
	if($KC_MODEL eq "course"){$kc = "course";}
	$kc =~s/"//g;

	#*****************************************
	# Resource granularity
	#*****************************************
	if($RES eq "verb"){$resource = $verb;}
	if($RES eq "verb_type"){$resource = $verb_type;}
	if($RES eq "name"){$resource = $name;}
	$resource =~s/"//g;
	#*****************************************
	# Resource filter
	#*****************************************
	if($INC_RES eq "no_res"){
		$res_type = "";
		if($verb ne "problem_check"){next;}
	}
	if($INC_RES eq "all_res"){$res_type = "all";}
	if($INC_RES eq "chapter_res"){$res_type = $chapter;}
	if($INC_RES eq "category_res"){$res_type = $category;}
	if($INC_RES eq "problem_res"){$res_type = $name;}

	#*****************************************
	# Convert data
	#*****************************************
	if(!exists $IdxResources{$resource} && $resource ne ""){
		$cnt_res++;
		$IdxResources{$resource} = $cnt_res;
		print RNAME "\"$resource\"\n";
	}
	
	if($verb eq "problem_check"){
		if($kc eq ""){next;}					
		if(!exists $IdxKCs{$kc}){
			$cnt_kc++;
			$IdxKCs{$kc} = $cnt_kc;					
			$HashKC{$cnt_kc} = 0;
		}
		$idx_kc = $IdxKCs{$kc};
		
		if($subpart eq ""){$subpart = $kc;}
		if(!exists $HashKCSub{$idx_kc}->{$subpart}){
				$HashKC{$idx_kc} = $HashKC{$idx_kc} + 1;
				$HashKCSub{$idx_kc}->{$subpart} = $HashKC{$idx_kc};
		}
		
		$current_subpart = $HashKCSub{$idx_kc}->{$subpart};

		if($correctness eq "correct"){$current_result= 2;}
		if($correctness eq "incorrect"){$current_result= 1;}
		
		if(!exists $HashLen{$actor}->{$idx_kc}){
			$HashLen{$actor}->{$idx_kc} = 0;
		}
		$HashLen{$actor}->{$idx_kc} = $HashLen{$actor}->{$idx_kc}  + 1;	
		
		if(!exists $PriorResources{$actor}->{$res_type}){					
			$current_resource = 1;			
		}else{
			$Ress = $PriorResources{$actor}->{$res_type};	
			delete $PriorResources{$actor}->{$res_type};		
			$HashLen{$actor}->{$idx_kc} = $HashLen{$actor}->{$idx_kc} + @$Ress;
			$current_resource = join ",",@$Ress,1;				
		}

		if(!exists $HashDataResult{$actor}->{$idx_kc}){
			$HashDataResult{$actor}->{$idx_kc} = $current_result;
		}else{
			$HashDataResult{$actor}->{$idx_kc} = join ",", $HashDataResult{$actor}->{$idx_kc}, $current_result;			
		}
		
		if(!exists $HashDataSubpart{$actor}->{$idx_kc}){
			$HashDataSubpart{$actor}->{$idx_kc} = $current_subpart;
		}else{
			$HashDataSubpart{$actor}->{$idx_kc} = join ",", $HashDataSubpart{$actor}->{$idx_kc}, $current_subpart;			
		}
		
		if(!exists $HashRes{$actor}->{$idx_kc}){
			$HashRes{$actor}->{$idx_kc} = $current_resource;	
		}else{
			$HashRes{$actor}->{$idx_kc} = join ",", $HashRes{$actor}->{$idx_kc},$current_resource;	
		}	
	}elsif($secs_to_next < 5){ # filter out the resources < 5s
		next;
	}else{
		if(!exists $IdxResources{$resource}){next;}
		$res = $IdxResources{$resource};
		if(!exists $PriorResources{$actor}->{$res_type}){
			$Ress = [];
			$PriorResources{$actor}->{$res_type} = $Ress;
		}
		$Ress = $PriorResources{$actor}->{$res_type};
		push @$Ress,$res;
		if(@$Ress > $RES_NUM){shift @$Ress;}
		$PriorResources{$actor}->{$res_type} = $Ress;
	}	
}
close RNAME;

#*****************************************
# print KC, subpart mapping
#*****************************************
open(QNAME,">$outNameKC") or
	die "create output $outNameKC error!";
print QNAME "KC,Subparts\n";

foreach $kc(sort {$IdxKCs{$a} <=> $IdxKCs{$b}} keys %IdxKCs){
	$idx_kc = $IdxKCs{$kc};
	foreach $subpart(sort {$HashKCSub{$idx_kc}->{$a} <=> $HashKCSub{$idx_kc}->{$b}} keys %{$HashKCSub{$idx_kc}}){
		print QNAME "\"$kc\",\"$subpart\"\n";
	}
}
close QNAME;

#*****************************************
# Print CV test files
#*****************************************
for($n=0; $n<$NUM_CV; $n++){	
	foreach $actor(@{$FoldOfActor[$n]}){		
		for($k=0; $k<$cnt_kc; $k++){
			if(!exists $HashLen{$actor}->{$k+1}){next;}
			$datafile = sprintf("%s/%s.%d.kc_%d.test.data.dat",$DIR,$data_name,$n+1,$k+1);
			open(DATA,">>$datafile") or die "creat output $datafile error!";

			$lenfile = sprintf("%s/%s.%d.kc_%d.test.len.dat",$DIR,$data_name,$n+1,$k+1);
			open(LEN,">>$lenfile") or die "creat output $lenfile error!";	
			
			@ress = split /,/,$HashRes{$actor}->{$k+1};
			@results = split /,/,$HashDataResult{$actor}->{$k+1};
			@subparts = split /,/,$HashDataSubpart{$actor}->{$k+1};

			$num_subpart = $HashKC{$k+1};
			@empty = ();
			for($s=0; $s<$num_subpart; $s++){ $empty[$s] = 0;}
			for($i=0; $i<@ress; $i++){
				@attempt = @empty;
				if($ress[$i] == 1){
					$idx_subpart = (shift @subparts) - 1;
					$attempt[$idx_subpart] = shift @results;	
				}
				$current_data = join ",",$ress[$i],@attempt;
				print DATA $current_data,"\n";
			}
			print LEN $actor, ",",$HashLen{$actor}->{$k+1},"\n";
			close DATA;
			close LEN;
		}
	}	
}

#*****************************************
# merge and print CV training files
#*****************************************
for($n=0; $n<$NUM_CV; $n++){
	for($k=0; $k<$cnt_kc; $k++){
		$train_datafile = sprintf("%s/%s.%d.kc_%d.train.data.dat",$DIR,$data_name,$n+1,$k+1);
		$train_lenfile = sprintf("%s/%s.%d.kc_%d.train.len.dat",$DIR,$data_name,$n+1,$k+1);

		for($nn=0; $nn<$NUM_CV; $nn++){
			if($nn ne $n){
				$datafile = sprintf("%s/%s.%d.kc_%d.test.data.dat",$DIR,$data_name,$nn+1,$k+1);
				$lenfile = sprintf("%s/%s.%d.kc_%d.test.len.dat",$DIR,$data_name,$nn+1,$k+1);
				$cmd = "paste ".$datafile." >> ".$train_datafile;
				system($cmd) if -e $datafile;
				$cmd = "paste ".$lenfile ." >> ".$train_lenfile ;
				system($cmd) if -e $lenfile;		
			}
		}
	}
}

#--------------------
sub log_die
{
    write_log(@_);
    die @_;
}

sub log_warn
{
    write_log(@_);
}

sub write_log
{
     open LOG,">>",$logfile;
     print LOG @_,"\n";
     close LOG;
}
#--------------------
