#!/bin/sh
# ** AUTO GENERATED **

# 1.4.1 - Ensure bootloader password is set (Automated) - Server1 Workstation1

check_bootloader_password() {
 local grubdir=$1
 shift
 local grubfile=$1
 shift
 tst1="" 
 tst2="" 
 output="" 
 userfile="$grubdir/user.cfg" 
 [ -f "$userfile" ] && grep -Pq '^\h*GRUB2_PASSWORD\h*=\h*.+$' "$userfile" && output="\n PASSED: bootloader 
password set in \"$userfile\"\n\n" 
 if [ -z "$output" ] && [ -f "$grubfile" ]; then 
 grep -Piq '^\h*set\h+superusers\h*=\h*"?[^"\n\r]+"?(\h+.*)?$' "$grubfile" && tst1=pass 
 grep -Piq '^\h*password\h+\H+\h+.+$' "$grubfile" && tst2=pass [ "$tst1" = pass ] && [ "$tst2" = pass ] \
 && output="\n\n*** PASSED: bootloader password set in \"$grubfile\" ***\n\n" 
 fi 
 [ -n "$output" ] && exit 0 # && echo $output
}
efidir=$(find /boot/efi/EFI/* -type d -not -name 'BOOT')
gbdir=$(find /boot -maxdepth 1 -type d -name 'grub*') 
for dir in ${efidir}; do
 if [ -f "$dir"/grub.cfg ]; then
 grubfile="$dir/grub.cfg"
 check_bootloader_password $dir $grubfile
 fi
done
for dir in ${gbdir}; do
 if [ -f "$dir"/grub.cfg ]; then
 grubfile="$dir/grub.cfg"
 check_bootloader_password $dir $grubfile
 fi
done
# echo -e "\n\n *** FAILED: bootloader password is not set ***\n\n"
exit 1

