#!/bin/bash
#variable
output=$HOME/research/sys_info.txt
ipv6=$(ip addr |grep inet |tail -2 |head -1)
exec=$(find /home -type f -perm 777)
files=('/etc/shadow' '/etc/passwd/')
commands=('date' 'uname -a' 'hostname -s')
 
#check sudo command
if [ $uid = 0]
then
        echo "please Do Not run this  with sudo!" 
        exit
fi

#create research directory with if statement
if [ ! -d $HOME/research ]
then
          mkdir $HOME/research
fi
#create if statement to check sys_info.txt file
if [ -f >> $output ]
then 
             rm >> $output

#body
echo "A quick system audit script" > $output
#date >> $outpput
#for loop to display commands 
for command in (${command[@]};
do
             results=$(${commands[$command]})  
             echo "results of the \"${commands[$command]}\ is:" >> $output
             echo $results >> $output
             echo "" >> $output
done

#output a title
echo " A quick system audit script "

#output date 
d+a
te
 #output: machine info
echo $MACHTYPE

#output: machine info (uname)
echo -e "uname info: $(uname -a) \n"

#output: ip address 
echo -e "Ip Info: $(ip addr | head -9 | tail -1) \n"

#output: hostname
hostname

# output: hostname 
echo "hostname: $(hostname -s)"

#output dns info 
#cat /etc/resolve.conf | tail -n 2 




output memory inf0
free
output memory info
output: cpu info
lscpu
#output: disk usage
df -h | head -n 2
#output: current users
who


#create research directory 
mkdir ~/research 2> /dev/null

#find 777 (excutable) files 
echo -e "\n777 files:" >> ~/research/sys_info.txt
find /-type f -perm 777 >> ~/research/sys_info.txt

#find  top 10 processes 
echo -e "\ntop 10 processes" >> ~/research/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head -n 11 
echo -e "\nThe permissions for sensitive /etc files: \n" >> $output 
#print permisions of /etc files
for file in ${files[@]};
do
           ls -l $file >> $output
done

#check sudo abilities for each user
for user in $(ls /home)
do
            sudo -lU $user >> $output
done


#print $output to terminal
#bootom of page 
cat $output
