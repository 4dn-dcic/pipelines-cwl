WDL_NAME=$1
CROMWELL_JAR=$2
WDL_FILENAME=converted_wdl_beta/$1.wdl
INPUT_JSON_NAME=$1.input.json
CWD=$(pwd)
OUTDIR=$CWD/tests/test_outdir
LOCAL_WDL_TMPDIR=$CWD/tests/test_tmp
#WDL_RUNNER="java -jar $CROMWELL_JAR run"
#WDL_RUNNER="/usr/bin/java8 -jar $CROMWELL_JAR run"
WDL_RUNNER="java -jar $CROMWELL_JAR run"
RUNNER_FLAGS=""
echo $WDL_RUNNER 
WORKFLOW_INPUT=tests/test_input_json/wdl/$INPUT_JSON_NAME
echo $WDL_FILENAME
#$WDL_RUNNER $RUNNER_FLAGS -i $WORKFLOW_INPUT $WDL_FILENAME | python $CWD/tests/json_null_test.py
$WDL_RUNNER $RUNNER_FLAGS -i $WORKFLOW_INPUT $WDL_FILENAME 
