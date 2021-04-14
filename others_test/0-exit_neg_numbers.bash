#!/bin/bash
#
# simple test with exit to check if the exist status is the correct with negative numbers
command="exit -1"

tmp1="testing_custom_$RANDOM"
tmp2="testing_real_$RANDOM"
# create a temporal file
touch $tmp_file
# send commands
echo "$command" | $SHELL > $tmp1 2>/dev/null
# variable to get status
let ret_actual=$?
# send commands
echo "$command" | /bin/sh > $tmp2 2>/dev/null
# get status
let ret_expected=$?
#wait a little bit
$SLEEP $SLEEPSECONDS
$SLEEP $SLEEPSECONDS
# check if the status is the expected
if [[ $ret_actual -eq $ret_expected ]]; then
	print_ok
else
	print_ko
	$ECHO -e "    >[\033[31mYour status exit\033[37m]";
	$ECHO -e "\t$ret_actual";
	$ECHO -e "    >[\033[32mExpect status exit\033[37m]";
	$ECHO -e "\t$ret_expected";
fi

# clean up
stop_shell
rm -f $tmp1
rm -f $tmp2
