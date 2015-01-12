#!/bin/sh
# KC models: subpart, problem, category, cat_type, chapter
# Resource granularity: verb, verb_type, json_id/name
# Resource filter: no_res, all_res, chapter_res, category_res

TMP_DATA_DIR=$1
NAME=$2
HMM_DIR=$3 
LOG=$4

# scripts directory
SCRIPTS_DIR=/home/yanbox/data_preprocess_scripts

echo "-- filter = no resources"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart no_res NULL NULL $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem no_res NULL NULL $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category no_res NULL NULL $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type no_res NULL NULL $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter no_res NULL NULL $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course no_res NULL NULL $LOG


##----------------------------------------------
echo "-- filter = all resources";
echo "-- Resource = verb, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart all_res verb 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem all_res verb 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category all_res verb 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type all_res verb 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter all_res verb 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course all_res verb 1 $LOG

echo "-- filter = all resources";
echo "-- Resource = verb_type, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart all_res verb_type 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem all_res verb_type 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category all_res verb_type 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type all_res verb_type 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter all_res verb_type 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course all_res verb_type 1 $LOG

echo "-- filter = all resources";
echo "-- Resource = name, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart all_res name 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem all_res name 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category all_res name 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type all_res name 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter all_res name 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course all_res name 1 $LOG

echo "-- filter = all resources";
echo "-- Resource = verb, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart all_res verb 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem all_res verb 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category all_res verb 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type all_res verb 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter all_res verb 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course all_res verb 3 $LOG

echo "-- filter = all resources";
echo "-- Resource = verb_type, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart all_res verb_type 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem all_res verb_type 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category all_res verb_type 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type all_res verb_type 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter all_res verb_type 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course all_res verb_type 3 $LOG

echo "-- filter = all resources";
echo "-- Resource = name, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart all_res name 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem all_res name 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category all_res name 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type all_res name 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter all_res name 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course all_res name 3 $LOG

echo "-- filter = all resources";
echo "-- Resource = verb, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart all_res verb 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem all_res verb 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category all_res verb 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type all_res verb 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter all_res verb 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course all_res verb 5 $LOG

echo "-- filter = all resources";
echo "-- Resource = verb_type, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart all_res verb_type 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem all_res verb_type 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category all_res verb_type 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type all_res verb_type 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter all_res verb_type 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course all_res verb_type 5 $LOG

echo "-- filter = all resources";
echo "-- Resource = name, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart all_res name 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem all_res name 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category all_res name 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type all_res name 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter all_res name 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course all_res name 5 $LOG

#----------------------------------------------
echo "-- filter = resources in the same chapter";
echo "-- Resource = verb, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart chapter_res verb 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem chapter_res verb 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category chapter_res verb 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type chapter_res verb 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter chapter_res verb 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course chapter_res verb 1 $LOG

echo "-- filter = resources in the same chapter";
echo "-- Resource = verb_type, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart chapter_res verb_type 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem chapter_res verb_type 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category chapter_res verb_type 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type chapter_res verb_type 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter chapter_res verb_type 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course chapter_res verb_type 1 $LOG

echo "-- filter = resources in the same chapter";
echo "-- Resource = name, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart chapter_res name 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem chapter_res name 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category chapter_res name 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type chapter_res name 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter chapter_res name 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course chapter_res name 1 $LOG

echo "-- filter = resources in the same chapter";
echo "-- Resource = verb, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart chapter_res verb 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem chapter_res verb 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category chapter_res verb 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type chapter_res verb 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter chapter_res verb 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course chapter_res verb 3 $LOG

echo "-- filter = resources in the same chapter";
echo "-- Resource = verb_type, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart chapter_res verb_type 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem chapter_res verb_type 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category chapter_res verb_type 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type chapter_res verb_type 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter chapter_res verb_type 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course chapter_res verb_type 3 $LOG

echo "-- filter = resources in the same chapter";
echo "-- Resource = name, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart chapter_res name 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem chapter_res name 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category chapter_res name 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type chapter_res name 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter chapter_res name 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course chapter_res name 3 $LOG

echo "-- filter = resources in the same chapter";
echo "-- Resource = verb, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart chapter_res verb 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem chapter_res verb 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category chapter_res verb 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type chapter_res verb 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter chapter_res verb 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course chapter_res verb 5 $LOG

echo "-- filter = resources in the same chapter";
echo "-- Resource = verb_type, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart chapter_res verb_type 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem chapter_res verb_type 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category chapter_res verb_type 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type chapter_res verb_type 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter chapter_res verb_type 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course chapter_res verb_type 5 $LOG

echo "-- filter = resources in the same chapter";
echo "-- Resource = name, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart chapter_res name 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem chapter_res name 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category chapter_res name 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type chapter_res name 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter chapter_res name 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course chapter_res name 5 $LOG

#----------------------------------------------
echo "-- filter = resources in the same category";
echo "-- Resource = verb, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart category_res verb 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem category_res verb 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category category_res verb 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type category_res verb 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter category_res verb 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course category_res verb 1 $LOG

echo "-- filter = resources in the same category";
echo "-- Resource = verb_type, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart category_res verb_type 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem category_res verb_type 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category category_res verb_type 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type category_res verb_type 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter category_res verb_type 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course category_res verb_type 1 $LOG

echo "-- filter = resources in the same category";
echo "-- Resource = name, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart category_res name 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem category_res name 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category category_res name 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type category_res name 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter category_res name 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course category_res name 1 $LOG

echo "-- filter = resources in the same category";
echo "-- Resource = verb, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart category_res verb 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem category_res verb 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category category_res verb 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type category_res verb 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter category_res verb 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course category_res verb 3 $LOG

echo "-- filter = resources in the same category";
echo "-- Resource = verb_type, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart category_res verb_type 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem category_res verb_type 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category category_res verb_type 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type category_res verb_type 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter category_res verb_type 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course category_res verb_type 3 $LOG

echo "-- filter = resources in the same category";
echo "-- Resource = name, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart category_res name 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem category_res name 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category category_res name 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type category_res name 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter category_res name 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course category_res name 3 $LOG

echo "-- filter = resources in the same category";
echo "-- Resource = verb, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart category_res verb 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem category_res verb 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category category_res verb 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type category_res verb 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter category_res verb 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course category_res verb 5 $LOG

echo "-- filter = resources in the same category";
echo "-- Resource = verb_type, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart category_res verb_type 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem category_res verb_type 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category category_res verb_type 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type category_res verb_type 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter category_res verb_type 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course category_res verb_type 5 $LOG

echo "-- filter = resources in the same category";
echo "-- Resource = name, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart category_res name 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem category_res name 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category category_res name 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type category_res name 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter category_res name 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course category_res name 5 $LOG

#----------------------------------------------	
echo "-- filter = resources in the same problem";
echo "-- Resource = verb, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart problem_res verb 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem problem_res verb 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category problem_res verb 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type problem_res verb 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter problem_res verb 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course problem_res verb 1 $LOG

echo "-- filter = resources in the same problem";
echo "-- Resource = verb_type, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart problem_res verb_type 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem problem_res verb_type 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category problem_res verb_type 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type problem_res verb_type 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter problem_res verb_type 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course problem_res verb_type 1 $LOG

echo "-- filter = resources in the same problem";
echo "-- Resource = name, number prior res = 1"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart problem_res name 1 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem problem_res name 1 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category problem_res name 1 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type problem_res name 1 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter problem_res name 1 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course problem_res name 1 $LOG

echo "-- filter = resources in the same problem";
echo "-- Resource = verb, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart problem_res verb 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem problem_res verb 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category problem_res verb 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type problem_res verb 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter problem_res verb 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course problem_res verb 3 $LOG

echo "-- filter = resources in the same problem";
echo "-- Resource = verb_type, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart problem_res verb_type 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem problem_res verb_type 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category problem_res verb_type 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type problem_res verb_type 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter problem_res verb_type 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course problem_res verb_type 3 $LOG

echo "-- filter = resources in the same problem";
echo "-- Resource = name, number prior res = 3"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart problem_res name 3 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem problem_res name 3 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category problem_res name 3 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type problem_res name 3 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter problem_res name 3 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course problem_res name 3 $LOG

echo "-- filter = resources in the same problem";
echo "-- Resource = verb, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart problem_res verb 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem problem_res verb 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category problem_res verb 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type problem_res verb 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter problem_res verb 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course problem_res verb 5 $LOG

echo "-- filter = resources in the same problem";
echo "-- Resource = verb_type, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart problem_res verb_type 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem problem_res verb_type 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category problem_res verb_type 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type problem_res verb_type 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter problem_res verb_type 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course problem_res verb_type 5 $LOG

echo "-- filter = resources in the same problem";
echo "-- Resource = name, number prior res = 5"
echo "-- -- KC = subpart"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR subpart problem_res name 5 $LOG
echo "-- -- KC = problem"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR problem problem_res name 5 $LOG
echo "-- -- KC = category"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR category problem_res name 5 $LOG
echo "-- -- KC = cat_type"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR cat_type problem_res name 5 $LOG
echo "-- -- KC = chapter"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR chapter problem_res name 5 $LOG
echo "-- -- KC = course"
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/convert_data.perl $TMP_DATA_DIR $NAME $HMM_DIR course problem_res name 5 $LOG

#----------------------------------------------	
