#!/bin/bash


dot() { file=$1; shift; . "$file"; }
dot ./logger.sh ./logHere.log



getDateTimeNow(){
  echo "$(date +"%Y-%m-%d @ %r # %Z")"
}
#datum=$(date +"%Y-%m-%d @ %r # %Z")

# Tally_testEntry
Tally_entry FATAL "qqqqqq"
Tally_scriptEnd
exit


SCRIPTENTRY
INFO "Updating user details..."
ERROR "aaaa"
test
SCRIPTEXIT

echo "done"

exit