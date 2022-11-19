#!/bin/bash

#restructure data tree by date

#loop through files in dir

for file in *

do
    
    #get date in each file
    
    date=$(head -1 $file | tr "-" "/")
    
    #create dir and move files
    
    mkdir -p $date
    
    mv $file $date
    
done
