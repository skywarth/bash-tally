#!/bin/bash

# base is from this lad: https://www.cubicrace.com/2016/03/log-tracing-mechnism-for-shell-scripts.html
# Thanks

availableLogTypes=('DEBUG' 'INFO' 'WARN' 'ERROR' 'FATAL' 'BEGIN' 'END')

logLocation=$1
logScriptEntry=$2 # used far below
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

_createEntry(){
logType=${1:-UNKNOWN}
message=${2:-(NO MESSAGE)}

script_name=`basename "$0"`
script_name="${script_name%.*}"
echo "[$(_getDateTimeNow)] [${logType}] {$script_name} > ${message}" >> $SCRIPT_LOG
}


Tally_testEntry(){
  _createEntry DEBUG "yo whaddup"
}


Tally_entry (){ #for general use
  _createEntry "$1" "$2"
}

Tally_debug (){
    _createEntry DEBUG "$1"
}

Tally_info (){
    _createEntry INFO "$1"
}
Tally_warn (){
    _createEntry warn "$1"
}

Tally_error (){
    _createEntry ERROR "$1"
}

Tally_fatal (){
    _createEntry FATAL "$1"
}

Tally_scriptBegin (){
  _createEntry BEGIN "Script execution started"
}

Tally_scriptEnd (){
 _createEntry END "Script execution ended"
}


if [[ $logScriptEntry == "log-script-begin" ]]
then
Tally_scriptBegin
fi