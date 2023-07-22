#!/bin/sh
# ** AUTO GENERATED **

# 1.4.2 - Ensure permissions on bootloader config are configured (Automated) - Server1 Workstation1

check_bootloader_permission() {
 # declare parametter
    local grubdir=$1
    shift
    local grubfile=$1
    shift
    userfile="$grubdir/user.cfg" 
 # check grubfile permission
    stat -L -c "%a %u %g" $grubfile | grep -Eq "[0-7]00 0 0$" && cond1=pass
 # check userfile permission
    if [ -f "$userfile" ]; then 
        stat -L -c "%a %u %g" $userfile | grep -Eq "[0-7]00 0 0$" && cond2=pass
    else 
 # ignore if not existed
        cond2=pass
    fi 
 # If passing is true we pass 
    if [[ "$cond1" == pass && "$cond2" == pass ]] ; then 
 # return command success code
        exit 0
    else 
 # print the reason why we are failing 
        return 1
    fi
}
