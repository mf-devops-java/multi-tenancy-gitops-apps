#!/bin/bash
#
# A simple MVP script that will run mfSC against a queue manager.
ckksum=""

# Outer loop that keeps the mf service running
while true; do

   tmpCksum=`cksum /dynamic-mf-config-mfsc/dynamic-definitions.mfsc | cut -d" " -f1`

   if (( tmpCksum != cksum ))
   then
      cksum=$tmpCksum
      echo "Applying mfSC"
      runmfsc $1 < /dynamic-mf-config-mfsc/dynamic-definitions.mfsc
   else
      sleep 3
   fi

done
