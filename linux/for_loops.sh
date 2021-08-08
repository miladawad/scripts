#!/bin/bash

#variable
states=('nebraska' 'hawaii' 'california' 'virginia' 'maryland')
ls_out=$(ls)
execs=(find /home -type f -perm 777 2> /dev/null)
#number variables any array will work (verified)
#nums=(1 2 3 4 5 6 7 8 9)
nums=$(echo {0..9})

for state in ${states[@]};
do
#      echo $states
       if [ $state == 'hawaii' ];
       then
                echo "hawaii is the best!"
       else
               echo "i'm not fond of hawaii"
        fi
done

#check numbers from array (3 ,5, 7)
for num in ${nums[@]};
do
        if [ $num = 3] || [ $num = 5 ] || [ $num = 7]  
        then
            echo $num
         fi 
done
 
#print files from directory
for list in ${ls_out[@]};
do 
             echo list
done

#print executables using for loop
for  exec in ${execs[@]};
do 
         echo $exec
done
