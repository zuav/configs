#!/bin/sh

cd

base_dir=~/src/configs
backup_dir=~/configs.orig/`date +%s`
mkdir -p $backup_dir > /dev/null

#
# create common config files
#

common_list=".ratpoisonrc .xbindkeysrc .xsession .emacs .environment .gitconfig"

for i in $common_list
do
    mv $i $backup_dir/
    ln -sf $base_dir/common/$i $i
done


#
# create host specific config files
#

hostname=`hostname -s`
host_list=".gnus.el"

if [ ! -d $base_dir/$hostname ]
then
    echo "No config dir for host: $hostname"
else
    for i in $host_list
    do
        mv $i $backup_dir/
        ln -sf $base_dir/$hostname/$i $i
    done
fi


cd -
