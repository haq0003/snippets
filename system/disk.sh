#!/bin/bash
for DISK in $(lsblk  | grep disk | grep -v veeam | awk '{print $1}')
do
        STATE=$(smartctl -a /dev/$DISK | grep Raw_Read_Error_Rate | awk '{print $10}')
        if [ "$STATE" -gt 0 ]
        then
                echo $DISK : Problem : Raw_Read_Error_Rate = $STATE >> /tmp/disk.txt;
        fi
done

if [ -e /tmp/disk.txt ]
then
        mail -s "Raw_Read_Error_Rate sur $HOSTNAME" admin@XXXX.fr < /tmp/disk.txt
fi
rm -fr /tmp/disk.txt
