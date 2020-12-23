#!/bin/bash

Help()
        {
            echo "                                         "
            echo "Syntax: ./xmlAppend.sh [options]"
            echo "options:"
            echo "-h     Print this Help."
            echo "Source Git Log File"
            echo "                                         "
            echo "Example=> ./xmlAppend.sh sourceGitLogFile"
            echo "                                         "
        }

if [ -z $1 ]; then
    echo "Source Git Log File is Not Provided"
    Help
    exit 1
else
    if [ -f "$1" ]; then
        sourceGitLogFile=$1

        while getopts ":h" option; do
        case $option in
            h) # display Help
                Help
                exit;;
        esac
        done

        linesToAppend=`cat ${sourceGitLogFile} | tr -s " " | grep "+ <" | sed 's/^.//g'`
        {
            echo """<?xml version=\"1.0\" encoding=\"UTF-8\"?>"""
            echo """<Package xmlns=\"http://soap.sforce.com/2006/04/metadata\">"""
            echo """${linesToAppend}"""
            echo """</Package>"""
        } > destFile.xml
        
    else
        echo "Provided input is not File, Please check File Type or File Path"
        Help
        exit 1
    fi
fi
