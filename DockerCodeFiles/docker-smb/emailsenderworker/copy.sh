#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  copy.sh
# 
#         USAGE:  ./copy.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Jamal Shahverdiev (), jamal.shahverdiev@gmail.com
#       COMPANY:  Pronet LLC
#       VERSION:  1.0
#       CREATED:  10/29/2019 11:25:11 AM +04
#      REVISION:  ---
#===============================================================================

cp application.properties email-sender-worker/src/main/resources/application.properties
pushd email-sender-worker
mvn package
popd
