#!/bin/bash

#get average, maximum and minimum population in a town aggregated for all years

#arg towns...

if [ $# -eq 0 ]

then
    
    echo "No arguments provided"
    
    exit 1
    
fi

#create townFileIndex if not exists

if ! test -f townFileIndex

then
    
    $(createTownIndex)
    
fi

for i in $@

do
    
    #check if town exists in the data
    
    if cat townFileIndex | grep -qw $i
    
    then
        
        echo "$i:"
        
        townFileLines=$(cat townFileIndex | grep $i | cut -d":" -f2 | wc -l)
        
        townFile=$(cat townFileIndex | grep $i | head -1 | tail -1 | cut -d":" -f2)
        
        min=$(cat $townFile | tail -1)
        
        max=0
        
        #loop through the files of the town
        
        for ((j=1; j<=townFileLines; j++))
        
        do
            
            curFile=$(cat townFileIndex | grep $i | head -$j | tail -1 | cut -d":" -f2)
            
            popn=$(cat $curFile | tail -1)
            
            sum=$(expr $sum + $popn)
            
            num=$(expr $num + 1)
            
            if [ $min -gt $popn ]
            
            then
                
                min=$popn
                
            fi
            
            if [ $max -lt $popn ]
            
            then
                
                max=$popn
                
            fi
            
        done
        
        echo -e "The average population is $(expr $sum / $num)\nThe minimum population is $min\nThe maximum population is $max"
        
    else
        
        #town does not exist in records
        
        echo -e "$i:\nCannot find this town in the current records"
        
    fi
    
done