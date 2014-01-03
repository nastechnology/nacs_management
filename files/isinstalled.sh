#!/bin/bash
# dirtest.bash - Demo script by nixCraft under GPL v2.x+
# -------------------------------------------------------
app="$1"
 
[ $# -eq 0 ] && { echo "Usage: $0 dir-name"; exit 1; }
 
if [ -d "/Applications/$app.app"  ]
then
   echo "installed"
else
   echo "notinstalled"
fi