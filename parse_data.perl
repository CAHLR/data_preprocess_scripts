#!/usr/bin/perl -w
# Note: sed -i -e 's/^M//g' orginial_data_file
# Note: search !!!!! change for courses

use lib '/home/yanbox/perl5/lib/perl5';

use JSON::Parse ':all';
use Text::CSV_XS;
use Data::Dumper;

binmode STDOUT, ":encoding(UTF-8)";

$SIG{__DIE__} = \&log_die;
$SIG{__WARN__} = \&log_warn;

my $logfile = "log.parse.txt";

#*****************************************
# ARGV options: json_file, log_file
#*****************************************
$num_args = $#ARGV + 1;
if($num_args < 1){
	die "\nUsage: cat in_data|perl parse_data.perl json_file (log_file) >parse_data\n";
}

$json_file = $ARGV[0];

if($num_args == 2){
	$logfile = $ARGV[1];
}

open LOG, ">", $logfile;
close LOG;

#*****************************************
# Load course_structure.json file
#*****************************************
my $structureHash = json_file_to_perl($json_file);
my %IdToChapter;
my %NameToChapter;
my %DiscussionToCategory;
my %DiscussionTarget;
my %VerticalToContainer;
my %VerticalToSequential;
my %ProblemToContainer;
my %VideoToContainer;
my %ProblemToName;
my %VideoToName;

my @toks;
foreach $json_id(sort keys %$structureHash){
	# %IdToChapter: {$json_id -> chapter} 
	# chapter: Overview, Week 1...
	if($structureHash->{$json_id}->{'category'} eq "chapter"){
		$chapter = $structureHash->{$json_id}->{'metadata'}->{'display_name'};
		$children = $structureHash->{$json_id}->{'children'};
		foreach $sub_json_id(@$children){		
			$IdToChapter{$sub_json_id} = $chapter;
			$IdToContainer{$sub_json_id} = $chapter;
			$NameToChapter{$chapter} = $chapter;
		}
	}
	
	# %DiscussionToCategory: {$discussion_id -> category}	
	# category: Week 1..., Hofmework 1...
	#
	# %DiscussionTarget: {$discussion_id -> discussion_target}
	# discussion_target: L9P1: Cucumber Testing
	if($structureHash->{$json_id}->{'category'} eq "discussion"){
		$category = $structureHash->{$json_id}->{'metadata'}->{'discussion_category'};
		$target = $structureHash->{$json_id}->{'metadata'}->{'discussion_target'};
		$discussion_id = $structureHash->{$json_id}->{'metadata'}->{'discussion_id'};
		$DiscussionToCategory{$discussion_id} = $category;
		$DiscussionTarget{$discussion_id} = $target;
		$DiscussionToId{$discussion_id} = $json_id;		
	}

	# %ProblemToName: {$json_id -> name}
	# name: L10P4: RSpec Expectations
	if($structureHash->{$json_id}->{'category'} eq "problem"){
		$name = $structureHash->{$json_id}->{'metadata'}->{'display_name'};
		$ProblemToName{$json_id} = $name;
		$NameToId{$name} = $json_id;
	}

	# %IdToChapter: {$json_id -> chapter} 
	# chapter: Overview, Week 1...
	#
	# %VerticalToContainer: {$json_id -> container}
	# %ProblemToContainer: {$json_id -> container}
	# %VideoToContainer: {$json_id -> container}
	# container: Lecture 1: Course Introduction
	if($structureHash->{$json_id}->{'category'} eq "sequential"){		
		$children = $structureHash->{$json_id}->{'children'};
		$chapter = $IdToChapter{$json_id};	
		$container = $structureHash->{$json_id}->{'metadata'}->{'display_name'};
		$NameToChapter{$container} = $chapter;
		foreach $sub_json_id(@$children){
			$IdToChapter{$sub_json_id} = $chapter;	
			if($sub_json_id =~ m/vertical/){
				$VerticalToContainer{$sub_json_id} = $container;
				$VerticalToSequential{$sub_json_id} = $json_id;
			}
			$IdToContainer{$sub_json_id} = $container;
		}		
	}
	
	# %IdToChapter: {$json_id -> chapter} 
	# chapter: Overview, Week 1...
	#
	# %ProblemToContainer: {$json_id -> container}
	# %VideoToContainer: {$json_id -> container}
	# container: Lecture 1: Course Introduction
	if($structureHash->{$json_id}->{'category'} eq "vertical"){
		$children = $structureHash->{$json_id}->{'children'};
		if(exists $structureHash->{$json_id}->{'metadata'}->{'display_name'}){		
			$chapter = $IdToChapter{$json_id};
			$container = $structureHash->{$json_id}->{'metadata'}->{'display_name'};
			$NameToChapter{$container} = $chapter;
			
		}else{
			$container = $VerticalToContainer{$json_id};
			$chapter = $IdToChapter{$VerticalToSequential{$json_id}};
		}
		foreach $sub_json_id(@$children){	
			$IdToChapter{$sub_json_id} = $chapter;		
			$IdToContainer{$sub_json_id} = $container;			
		}	
	}
	
	# %VideoToName: {$json_id -> name}
	# name: L2V1: Service Oriented Architecture
	if($structureHash->{$json_id}->{'category'} eq "video"){
		if(exists $structureHash->{$json_id}->{'metadata'}->{'display_name'}){
			$name = $structureHash->{$json_id}->{'metadata'}->{'display_name'};
			$VideoToName{$json_id} = $name;
			$NameToId{$name} = $json_id;
		}
	}
	
}

#*****************************************
# parse input data file
#*****************************************
my $csv = Text::CSV_XS->new({ sep_char => ',' });

$line= <STDIN>;
print "secs_to_next,actor,verb,verb_type,",
	"chapter,category,category_type,",
      	"json_id,obj_name,name,result,",
      	"subpart,student_answer,correctness\n";

while($line= <STDIN>){
	chomp $line;
	if(!$csv->parse($line)){
		@tokens = split /,/,$line;
		$tokens[4] = "None";
		$line = join ',', @tokens;
		if(!$csv->parse($line)){
			warn "CSV_PARSE ERROR: Cannot parse csv, in line $.: $line.";
		}
	}

	@tokens = $csv->fields();
	
	my $time = $tokens[0];
	my $secs_to_next = $tokens[1];
	my $actor = $tokens[2];
	my $verb = $tokens[3];
	my $obj_name = $tokens[4];
	my $obj_type = $tokens[5];
	my $result = $tokens[6];
	my $meta = $tokens[7];
	my $ip = $tokens[8];
	my $event = $tokens[9];
	my $event_type = $tokens[10];
	my $page = $tokens[11];
	my $agent = $tokens[12];
	
	my $verb_type = "";
	my $cat_type = "";
	my $json_id = "";
	my $chapter = "";
	my $category = "";
	my $name = "";
	my $subpart = "";
	my $correctness = "";
	my $answer = "";
	
	# ignore all the empty actors
	if(!defined $actor){next;}
	if($actor eq ""){next;}
	
	
	if($verb =~ m/problem/){
		$verb_type = "Problem";
		# problem_check
		if($verb eq "problem_check"){
			$event =~ s/u"/u'/g;
			$event =~ s/",/',/g;
			$event =~ s/"\}/'\}/g;
			$event =~ s/"//g;			
			$event =~ s/None/\'None\'/g;
			$event =~ s/True/\'True\'/g;
			$event =~ s/False/\'False\'/g;
			$event =~ s/<pre.*<\/pre>//g; # for CS169
			$event =~ s/<div.*<\/div>//g; # for CS188
			$event =~ s/u'/"/g;
			$event =~ s/'/"/g;
			$event =~ s/"t /'t /g;
			$event =~ s/"s /'s /g;
			$event =~ s/s" /s' /g;	
			$event =~ s/I"/I'/g;
			$event =~ s/i"/I'/g;
			$event =~ s/"ll/'ll/g;
			$event =~ s/\\//g;
			$event =~ s/""None""/"None"/g;
			$event =~ s/""NA""/"NA"/g;
			$event =~ s/\["None"\]/None/g;

			$event =~ s/<p>//g;
			$event =~ s/<\/p>//g;
			$event =~ s/<br\/>//g;
			$event =~ s/<font color="//g;
			$event =~ s/">/ /g;
			$event =~ s/<\/font>/"/g;

			$event =~ s/<//g;
			$event =~ s/>//g;

			# only for Stat2.2x-2013_April
			$event =~ s/xmlns="/xmlns=/g;
			$event =~ s/MathML"/MathML/g;
			$event =~ s/"true"/true/g;
				

			if(!valid_json($event)){
				warn "JSON_PARSE ERROR: Cannot parse problem event: $event, in line $.: $line.";
				next;
			}
			
			$hash = parse_json ($event);
			
			$json_id = $hash->{'problem_id'};
			$correct_map = $hash->{'correct_map'};
			$student_answers = $hash->{'state'}->{'student_answers'};
			
			# reset problem result, conjunction of subparts 
			$result = "correct"; 	
			foreach $subpart(keys %$correct_map){
				$correctness = "";
				$answer = "";
				
				if(exists $correct_map->{$subpart}->{'correctness'}){
					$correctness = $correct_map->{$subpart}->{'correctness'};
					chomp $correctness;
				}
				
				if(exists $student_answers->{$subpart}){
					$answer = $student_answers->{$subpart};
					if(ref $answer eq "ARRAY"){
						$answer = join "|",@$answer;
						$student_answers->{$subpart} = $answer;
					}
				}
				
				#############################					
				$key_StudentSubpart = join "|",$actor,$subpart;
				
				if($correctness eq "incorrect"){				
					# ignore all empty incorrect
					if($answer eq ""){
						delete $correct_map->{$subpart};
						next;
					}
					
					# ignore incorrect having the same answer 
					# pretend incorrect didn't get re-ordered
					if(!exists $IncorrectStudentSubpart{$key_StudentSubpart}){
						$IncorrectStudentSubpart{$key_StudentSubpart} = "NULL";	
					}
					
					if($IncorrectStudentSubpart{$key_StudentSubpart} eq $answer){
						delete $correct_map->{$subpart};
						next;
					}
					$IncorrectStudentSubpart{$key_StudentSubpart} = $answer;				
				}elsif($correctness eq "correct"){			 				
					if(!exists $CorrectStudentSubpart{$key_StudentSubpart}){
						# keep first correct ?????? why empty corrects?
						$CorrectStudentSubpart{$key_StudentSubpart} = $answer;
					}else{
						#if($CorrectStudentSubpart{$key_StudentSubpart} eq "" && $answer ne ""){
						#	# keep first non-empty correct
						#	$CorrectStudentSubpart{$key_StudentSubpart} = $answer;	
						#}else{
							delete $correct_map->{$subpart};
							next;
						#}
					}
				}
				
				# reset problem result, conjunction of subparts 
				if($correctness eq "incorrect"){
					$result = "incorrect";
				}	
			}
			
			if(!exists $IdToChapter{$json_id}){
				warn "IdToChapter: Cannot find problem id: $json_id, in line $.: $line.";
			}else{$chapter = $IdToChapter{$json_id};}
				
			if(!exists $IdToContainer{$json_id}){
				warn "IdToContainer: Cannot find problem id: $json_id, in line $.: $line.";
			}else{$category = $IdToContainer{$json_id};}
				
			if(exists $ProblemToName{$json_id}){$name = $ProblemToName{$json_id};}

			$cat_type = $category;
			if($category =~ m/homework/i){
				$cat_type = "Homework";
			}
			if($category =~ m/lecture/i){
				$cat_type = "Lecture";
			}
			if($category =~ m/quiz/i){
				$cat_type = "Quiz";
			}
			if($category =~ m/exam/i){
				$cat_type = "Exam";
			}
									
			$obj_name = "\"".$obj_name."\"";
			$name = "\"".$name."\"";
			$category = "\"".$category."\"";
			$json_id = "\"".$json_id."\"";
			foreach $subpart(keys %$correct_map){
				$correctness = "";
				$answer = "";
				
				if(exists $correct_map->{$subpart}->{'correctness'}){
					$correctness = $correct_map->{$subpart}->{'correctness'};
					chomp $correctness;
				}
				
				if(exists $student_answers->{$subpart}){
					$answer = $student_answers->{$subpart};
				}
								
				$subpart = "\"".$subpart."\"";
				$answer= "\"".$answer."\"";
				print "$secs_to_next,$actor,$verb,$verb_type,",
			  		"$chapter,$category,$cat_type,",
					"$json_id,$obj_name,$name,$result,",
			  		"$subpart,$answer,$correctness\n";
			}
			if(!keys %$correct_map){
				$subpart = $json_id;
				$answer = "\"\"";
				$correctness = $result;
				print "$secs_to_next,$actor,$verb,$verb_type,",
			  		"$chapter,$category,$cat_type,",
					"$json_id,$obj_name,$name,$result,",
			  		"$subpart,$answer,$correctness\n";
				
			}
			#############################					
			next;
		}
		
		if($verb eq "problem_save" || $verb eq "problem_show_answer"){	
			$event =~ s/u"/u'/g;
			$event =~ s/",/',/g;
			$event =~ s/"\}/'\}/g;
			$event =~ s/"//g;		
			$event =~ s/None/\'None\'/g;
			$event =~ s/True/\'True\'/g;
			$event =~ s/False/\'False\'/g;
			$event =~ s/u'/"/g;
			$event =~ s/'/"/g;
			$event =~ s/"t /'t /g;
			$event =~ s/"s /'s /g;
			$event =~ s/s" /s' /g;
			$event =~ s/I"/I'/g;
			$event =~ s/i"/I'/g;
			$event =~ s/"ll/'ll/g;
			$event =~ s/\\'//g;	
			$event =~ s/\\//g;
			$event =~ s/""None""/"None"/g;
			$event =~ s/""NA""/"NA"/g;
			$event =~ s/\["None"\]/None/g;

			$event =~ s/<pre.*<\/pre>//g; # for CS169
			$event =~ s/<div.*<\/div>//g; # only for CS188

			$event =~ s/<p>//g;
			$event =~ s/<\/p>//g;
			$event =~ s/<br\/>//g;
			$event =~ s/<font color="//g;
			$event =~ s/">/ /g;
			$event =~ s/<\/font>/"/g;
			
			$event =~ s/<//g;
			$event =~ s/>//g;

			# only for Stat2.2x-2013_April
			$event =~ s/xmlns="/xmlns=/g;
			$event =~ s/MathML"/MathML/g;
			$event =~ s/"true"/true/g;
			
			if(!valid_json($event)){
				warn "JSON_PARSE ERROR: Cannot parse problem event: $event, in line $.: $line.";
				next;
			}
			
			$hash = parse_json ($event);
			
			$json_id = $hash->{'problem_id'};
			if(exists $IdToChapter{$json_id}){$chapter = $IdToChapter{$json_id};}
			if(exists $IdToContainer{$json_id}){$category = $IdToContainer{$json_id};}
			if(exists $ProblemToName{$json_id}){$name = $ProblemToName{$json_id};}	
		}
	
		# problem_view
		if($verb eq "problem_view"){
			$event_type =~ s/\/problem_get//g;
			$event_type =~ m/i4x/;
			$json_id = $& . $';	
			
			if(exists $IdToChapter{$json_id}){$chapter = $IdToChapter{$json_id};}
			if(exists $IdToContainer{$json_id}){$category = $IdToContainer{$json_id};}
			if(exists $ProblemToName{$json_id}){$name = $ProblemToName{$json_id};}
		}
	}

	# forum_xxxx, no parsing for:
	# -forum_search
	# -forum_view_followed_threads
	# -forum_view_user_profile	
	if($verb =~ m/forum/){
		$verb_type = "Discussion";
		if($verb eq "forum_create"){
			@toks = split/\//,$event_type;
			pop(@toks);
			pop(@toks);
			$json_id = pop(@toks); # discussion_id
		}elsif($verb eq "forum_view"){
			if($obj_name ne ""){
				@toks = split/\//,$event_type;
				$subpart = pop(@toks); # thread_num
				pop(@toks);
				$json_id = pop(@toks);	# discussion_id
				if(!exists $ThreadToID{$subpart}){
					$ThreadToID{$subpart} = $json_id;	
				}
			}else{
				$json_id = $event_type;
			}
		}elsif($verb eq "forum_view_inline"){
			@toks = split/\//,$event_type;
			$subpart = pop(@toks); # inline
			$json_id = pop(@toks); # discussion_id
		
		}else{
			$subpart = $obj_name;
			$subpart =~ s/\('//g;
			$subpart =~ s/',\)//g;
			if(exists $ThreadToID{$subpart}){
				$json_id = $ThreadToID{$subpart};	
			}else{
				$json_id = $subpart;
				#warn "ThreadToID: cannot find forum thread num: $subpart, in line $.: $line.";	
			}
		
		}
		if(!exists $DiscussionToCategory{$json_id}){
				#warn "DiscussionToCategory: Cannot find discussion_id: $json_id, in line $.: $line.";
		}else{
			$id = "";
			if(exists $DiscussionToId{$json_id}){$id = $DiscussionToId{$json_id};}
			if(exists $IdToChapter{$id}){$chapter = $IdToChapter{$id};}
			if(exists $IdToContainer{$id}){$category = $IdToContainer{$id};}
			if(exists $ProblemToName{$json_id}){$name = $ProblemToName{$json_id};}
		}
	}
	
		
	# page_close/view
	if($verb =~ m/page/){
		$verb_type = "Page";
		@toks = split /\//,$obj_name;
		$json_id = pop(@toks); # display_name of sequential, vertical
		if(!exists $NameToChapter{$json_id}){
			#warn "NameToChapter: Cannot find page name: $json_id, in line $.: $line.";
		}else{
			$chapter = $NameToChapter{$json_id};
		}
		$name = $json_id;
		$category = $json_id;					
	}
	
	# seq_goto/next/prev
	if($verb =~ m/seq/){
		$verb_type = "Sequential";
		$event_type = $event; # except DemoX
		if(!valid_json($event_type)){
			warn "JSON_PARSE ERROR: Cannot parse sequential event_type $event_type, in line $.: $line.";
			next;
		}
		$hash = parse_json ($event_type);	
		$json_id = $hash->{'id'};	
		
		if(!exists $IdToChapter{$json_id}){
			warn "IdToChapter: Cannot find sequential id: $json_id, in line $.: $line.";
		}else{
			$chapter = $IdToChapter{$json_id}; 
		}
		@toks = split /\//,$obj_name;
		$name = pop @toks;
		$category = $name;
		#$category = pop @toks;			
	}
	
	# video_pause/play
	if($verb =~ m/video/){
		$verb_type = "Video";
		$event_type = $event; # except DemoX
		if(!valid_json($event_type)){
			warn "JSON_PARSE ERROR: Cannot parse video event_type: $event_type, in line $.: $line.";
			next;
		}
		$hash = parse_json ($event_type);	
		$json_id = $hash->{'id'};		
		
		$json_id =~ s/-/\//g; # comment out for the new courses
		$json_id =~ s/i4x\//i4x:\/\//g;
		$json_id =~ s/_1x/.1x/g; #!!!!! change for courses
		
		if(!exists $IdToContainer{$json_id}){
			warn "IdToContainer: Cannot find video id: $json_id, in line $.: $line."; 
		}else{
			$category = $IdToContainer{$json_id};
			
		}

		if(exists $VideoToName{$json_id}){
			$name = $VideoToName{$json_id};
		}
			
		if(!exists $NameToChapter{$category}){
			if(exists $IdToChapter{$json_id}){
				$chapter = $IdToChapter{$json_id};
			}
		}else{
			$chapter = $NameToChapter{$category};
		}
	}
	
	# wiki_view
	if($verb =~ m/wiki/){
		$verb_type = "Wiki";
	}

	$cat_type = $category;
	if($category =~ m/homework/i){
		$cat_type = "Homework";
	}
	if($category =~ m/lecture/i){
		$cat_type = "Lecture";
	}
	if($category =~ m/quiz/i){
		$cat_type = "Quiz";
	}
	if($category =~ m/exam/i){
		$cat_type = "Exam";
	}
	$obj_name = "\"".$obj_name."\"";
	$name = "\"".$name."\"";
	$category = "\"".$category."\"";
	$json_id = "\"".$json_id."\"";
	$subpart = "\"\"";
	$answer= "\"\"";
	$correctness = "";
	if(!defined $chapter){$chapter=""};
	print "$secs_to_next,$actor,$verb,$verb_type,",
		"$chapter,$category,$cat_type,",
		"$json_id,$obj_name,$name,$result,",
		"$subpart,$answer,$correctness\n";	
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
