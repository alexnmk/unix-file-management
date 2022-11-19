#!/bin/bash

#calculates statistics for qualifying files by year
#aggregation methods - average, maximum, minimum, all

#arg - year, method

#checking constraints

if [ ! $# -eq 2 ]

then
    
    echo "The number of arguments supplied is not two"
    
    exit 1
    
fi

if [ ! "$(find . -name $1 | tr -d ./)" == $1 ]

then
    
    echo "The year number does not correspond to one available in the tree"
    
    exit 2
    
fi

if [ ! $2 == "average" ] && [ ! $2 == "minimum" ] && [ ! $2 == "maximum" ] && [ ! $2 == "all" ]

then
    
    echo "The keyword is not one of those listed"
    
    exit 3
    
fi

fileByYear=$(find ./$1 -type f)

#average function

function avg() {
    
    for file in $fileByYear
    
    do
        
        sum=$(expr $sum + $(tail -1 $file))
        
        num=$(expr $num + 1)
        
    done
    
    avg=$(expr $sum / $num)
    
    echo $avg
    
}

#minimum function

function min() {
    
    temp=$(cat $fileByYear | head -4 | tail -1)
    
    for file in $fileByYear
    
    do
        
        if [ $temp -gt $(tail -1 $file) ]
        
        then
            
            temp=$(tail -1 $file)
            
        fi
        
    done
    
    echo $temp
    
}

#maximum function

function max() {
    
    temp=0
    
    for file in $fileByYear
    
    do
        
        if [ $temp -lt $(tail -1 $file) ]
        
        then
            
            temp=$(tail -1 $file)
            
        fi
        
    done
    
    echo $temp
    
}

#output

if [ $2 == "average" ]

then
    
    echo "The average population for the year $1 was $(avg)"
    
fi

if [ $2 == "minimum" ]

then
    
    echo "The minimum population for the year $1 was $(min)"
    
fi

if [ $2 == "maximum" ]

then
    
    echo "The maximum population for the year $1 was $(max)"
    
fi

if [ $2 == "all" ]

then
    
    echo "average is $(avg)"
    
    echo "maximum is $(max)"
    
    echo "minimum is $(min)"
    
fi
