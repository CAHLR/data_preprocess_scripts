#!/bin/sh
#$ -cwd -S /bin/sh -j oe -o ~/.jobs_output/
# Note: sed -i -e 's/^M//g' orginial_data_file

PATH=$PATH:/usr/local/bin:/home/yanbox/data_preprocess_scripts/
export PATH

if [ $# -eq 1 ]; then
	if [ "$1"=="-clean" ]; then
		set -x
		rm -f $TMP_DATA_DIR/*
		rm -f $LOG_DIR/*
		exit 1
	else
		echo "Usage:- $0 original_data_file course_structure_file"
		echo "Usage:- $0 -clean"
		exit 1
	fi
else
	if [ $# -ne 2 ]; then
		echo "Usage: - $0 original_data_file course_structure_file"
		echo "Usage: - $0 -clean"
		exit 1
	fi
fi

################################
# Variables
################################
DATA=$1
JSON=$2
NAME=`basename $DATA .csv`

# results
RESULT=cv_result.$NAME.xls

# scripts directory
SCRIPTS_DIR=/home/yanbox/data_preprocess_scripts

# log directory
LOG_DIR=$SCRIPTS_DIR/log

# edX-hmm direcotry
HMM_DIR=/home/yanbox/edX-hmm

# temporary data directory
TMP_DATA_DIR=/home/yanbox/data/tmp

# cross validation number
NUM_CV=5
################################

start_time=`date +%s`
echo "1. Parsing $NAME.csv ..."
cat $DATA | perl $SCRIPTS_DIR/parse_data.perl $JSON $LOG_DIR/parse_data.$NAME.log > $TMP_DATA_DIR/after_parse.$NAME.csv

echo "2. Generating splits for cross validation..."
cat $TMP_DATA_DIR/after_parse.$NAME.csv | perl $SCRIPTS_DIR/gen_splits.perl $TMP_DATA_DIR $NAME $NUM_CV

echo "3. Converting data for BKT..."
$SCRIPTS_DIR/run_convert_data.sh $TMP_DATA_DIR $NAME $HMM_DIR $LOG_DIR/convert_data.$NAME.log

#echo "4. Running BKT..."
#cmd="cd('$HMM_DIR');setup;model.run_models('$NAME','$RESULT',$NUM_CV);quit;"
#matlab -nodesktop -nosplash -nodisplay -r "$cmd"

#echo "Done."
echo Run time is $(expr `date +%s` - $start_time) s
#cp $HMM_DIR/$RESULT ./$RESULT
