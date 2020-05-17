#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  entrypoint.sh
# 
#         USAGE:  ./entrypoint.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Jamal Shahverdiev (), jamal.shahverdiev@gmail.com
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  05/17/2020 01:44:39 PM +04
#      REVISION:  ---
#===============================================================================

if [ $# != 2 ]
then
    echo "Usage: ./$(basename $0) StatsDIPaddress dynamicRangeNumber"
    exit 111
fi

echo -e "$1\n$2\n" | dotnet ShoeHub.DataGenerator.dll
