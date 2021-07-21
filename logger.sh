#!/bin/bash

# base is from this lad: https://www.cubicrace.com/2016/03/log-tracing-mechnism-for-shell-scripts.html
# Thanks



logLocation=$1
if [ -z $logLocation ]
then
logLocation=/home/$(logname)/default_logs.log
fi


SCRIPT_LOG=$logLocation

touch $SCRIPT_LOG
chmod 777 $logLocation

echo "bash-tally loaded for target ${logLocation}"


_getDateTimeNow(){
  echo "$(date +"%Y-%m-%d @ %r # %Z")"
}

_getEntryPrefix(){
   script_name=`basename "$0"`
 script_name="${script_name%.*}"
  echo "[$(_getDateTimeNow)] [TEST] {$script_name} > aaa"
}

Tally_testEntry(){
  echo "$(_getEntryPrefix)" >> $SCRIPT_LOG
}

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

test (){
  echo `date`
}
