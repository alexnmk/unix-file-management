#!/bin/bash

#get population of each town from index file

#arg towns...

if [ $# -eq 0 ]

then
    
    echo "No arguments provided"
    
    exit 1
    
fi

for i in $@

do
    
    #check if town exists in the data
    
    if cat townFileIndex | grep -qw $i
    
    then
        
        echo "$i:"
        
        townFileLines=$(cat townFileIndex | grep $i | cut -d":" -f2 | wc -l)
        
        #loop through the files of the town
        
        for ((j=1; j<=townFileLines; j++))
        
        do
            
            townFile=$(cat townFileIndex | grep $i | head -$j | tail -1 | cut -d":" -f2)
            
            echo "$(cat $townFile | head -1):$(cat $townFile | tail -1)"
            
        done
        
    else
        
        #town does not exist in records
        
        echo -e "$i:\nCannot find this town in the current records"
        
    fi
    
done