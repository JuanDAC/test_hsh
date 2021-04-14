#!/bin/bash
# by: Andrés Callejas - Marlon Garcia
# run //////bin///ls -la ..

command="//////bin///ls -la .."
tmp_file="checker_tmp_file_$RANDOM"

# clean up
stop_shell
rm -f $tmp_file

# create a pseudo random file
touch $tmp_file
# send commands
echo "$command" | /bin/sh > $tmp_file 2> /dev/null & 
echo "$command" | $SHELL > $OUTPUTFILE 2> /dev/null & 

# wait a little bit
$SLEEP $SLEEPSECONDS

# check the result
nmatchout=`cat $OUTPUTFILE | wc -l`
nmatch=`cat $tmp_file | wc -l`
if [ $nmatch -eq $nmatchout ]; then
       print_ok
else
       print_ko
	$ECHO -e "    >[\033[31mYour message error\033[37m]";
	$ECHO -e "\t$(cat $OUTPUTFILE)";
	$ECHO -e "    >[\033[32mExpect message error\033[37m]";
	$ECHO -e "\t$(cat $tmp_file)";
fi

# clean up
stop_shell
rm -f $tmp_file
