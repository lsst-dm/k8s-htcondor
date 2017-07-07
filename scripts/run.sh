#!/bin/bash

CONDOR_MASTER=/usr/sbin/condor_master
PGREP=/usr/bin/pgrep

$CONDOR_MASTER
$PGREP -f $CONDOR_MASTER
CONDOR_STATUS=$?

while [ $CONDOR_STATUS -eq 0 ]; do
    /usr/bin/sleep 5
    $PGREP -f $CONDOR_MASTER
    CONDOR_STATUS=$?
done

exit $CONDOR_STATUS
