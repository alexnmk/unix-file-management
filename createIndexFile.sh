#!/bin/bash

#create a sorted index file for town

files=$(find . -type f)

for file in $files

do
    
    #get towns
    
    town=$(head -3 $file | tail -1)
    
    #append index to index file
    
    echo $town:$file >> townFileIndex
    
done

#sort data

sort townFileIndex > tempFile

cat tempFile > townFileIndex

rm tempFile