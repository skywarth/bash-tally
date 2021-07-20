#!/bin/bash

# base is from this lad: https://www.cubicrace.com/2016/03/log-tracing-mechnism-for-shell-scripts.html
# Thanks


echo "logger run"
logLocation=$1
if [ -z $logLocation ]
then
logLocation=/home/$(logname)/default_logs.log
fi

echo $logLocation

SCRIPT_LOG=$logLocation

touch $SCRIPT_LOG
chmod 777 $logLocation

SCRIPTENTRY (){
 timeAndDate=`date`
 script_name=`basename "$0"`
 script_name="${script_name%.*}"
 echo "[$timeAndDate] [DEBUG]  > $script_name $FUNCNAME" >> $SCRIPT_LOG
}

SCRIPTEXIT (){
 script_name=`basename "$0"`
 script_name="${script_name%.*}"
 echo "[$timeAndDate] [DEBUG]  < $script_name $FUNCNAME" >> $SCRIPT_LOG
}

ENTRY (){
 local cfn="${FUNCNAME[1]}"
 timeAndDate=`date`
 echo "[$timeAndDate] [DEBUG]  > $cfn $FUNCNAME" >> $SCRIPT_LOG
}

EXIT (){
 local cfn="${FUNCNAME[1]}"
 timeAndDate=`date`
 echo "[$timeAndDate] [DEBUG]  < $cfn $FUNCNAME" >> $SCRIPT_LOG
}


INFO (){
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
    timeAndDate=`date`
    echo "[$timeAndDate] [INFO]  $msg" >> $SCRIPT_LOG
}


DEBUG (){
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
    timeAndDate=`date`
 echo "[$timeAndDate] [DEBUG]  $msg" >> $SCRIPT_LOG
}

ERROR (){
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
    timeAndDate=`date`
    echo "[$timeAndDate] [ERROR]  $msg" >> $SCRIPT_LOG
}
