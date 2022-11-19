#!/bin/bash

#check filenames with the non matching date stamps

#get full path

for file in $(find . -type f)

do
    
    #get directory name
    
    dirDate=$(dirname $file | tr -d ./)
    
    #get date in files
    
    fileDate=$(head -1 $file | tr -d -)
    
    #compare date
    
    if [ ! $dirDate == $fileDate ]
    
    then
        
        echo $file
        
    fi
    
done
