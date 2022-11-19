#!/bin/bash

#correct date in file

touch tempFile

corrFile=$(checkData)

for file in $corrFile

do
    
    #replace content in corruptedFile
    
    echo $(dirname $file | cut -c3- | tr / -)>>tempFile
    
    echo $(tail -3 $file | head -1)>>tempFile
    
    echo $(tail -2 $file | head -1)>>tempFile
    
    echo $(tail -1 $file)>>tempFile
    
    cat tempFile > $file
    
    #empty tempFile
    
    cp /dev/null tempFile
    
done

rm tempFile
