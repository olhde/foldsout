#!/bin/bash

# SCRIPT TO OUTSOURCE FOLDERS AND REPLACE THEM WITH SYMLINKS.
# THIS SCRIPT IS PROVIDED 'AS-IS' WITHOUT WARRANTY OF ANY KIND.

# starting search directory
srchdr="Documents"
# exclude if the path contains one of these names
xclds="(node_modules|stable-diffusion|models|pythons|environments)"
# outsource only folders with this names
fldrs="(render|rendering|renderings|Render|Rendering|Renderings)"
# mounting point for devices
mnt="/run/media/$USER"
# names of possible drives
drvs=(Renderings Rusty)
# set execute=1 to disable dryrun
execute=0
# set by script when drive found
drv=''

# Ask user for confirmation
echo "HAVE YOU CREATED A BACKUP?"
echo "Are you sure you want to continue with this operation (y/n)? "
read confirm
if [ "$confirm" != "y" ]; then
    echo "Operation aborted."
    exit 0
fi

# check if one of the drives is mounted
for d in ${drvs[@]}; do
    mntp="$mnt/$d"
    if mount | grep $mntp >/dev/null; then
        # found and set drive
        drv=$d
        break
    fi
done
if [ -z "$drv" ]; then
    echo 'SORRY, NO DRIVE FOUND!'
else
    echo "DRIVE $mntp FOUND!"
    find "$HOME/$srchdr" -type d \( -regextype posix-extended -regex ".*/${fldrs}" \) | while read dir; do
        if [[ $dir =~ ${xclds} ]]; then
            echo "EXCLUDE $dir"
        else
            drvdir="$mntp/${dir:${#HOME}+1}"
            echo "OUTSOURCING $dir TO $drvdir"
            if [ "$execute" = 1 ]; then
                # create directory structur
                mkdir -p $drvdir
                # copy directory
                rsync -azurv "$dir/" "$drvdir/"
                # REMOVE SOURCER DIRECTORY
                rm -rf $dir
                # CREATE SYMLINK
                ln -s $drvdir $dir
            else
                # output dry run
                echo "mkdir -p $drvdir"
                echo "rsync -azurv $dir/ $drvdir/"
                echo "rm -rf $dir"
                echo "ln -s $drvdir $dir"
            fi
        fi
    done
fi
