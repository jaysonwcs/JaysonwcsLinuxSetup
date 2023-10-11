#!/bin/bash

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.10.0
# ARG_OPTIONAL_SINGLE([device], [d], [Device that will be formatted], [/dev/sda])
# ARG_OPTIONAL_SINGLE([size], [s], [Size of boot/rescue partition], [5])
# ARG_OPTIONAL_SINGLE([mount], [m], [Directory that will be used to mount devices and images], [/mnt])
# ARG_OPTIONAL_SINGLE([image], [i], [Image with pre-system content], [~/pre-system.sfs])
# ARGBASH_SET_DELIM([ ])
# ARG_OPTION_STACKING([none])
# ARG_RESTRICT_VALUES([none])
# ARG_HELP([This script format and install a minimal system on the device to be able to install GRUB and rescue system])
# ARGBASH_GO

# [ <-- needed because of Argbash

# vvv  PLACE YOUR CODE HERE  vvv
# For example:
printf 'Value of --%s: %s\n' 'device' "$_arg_device"
printf 'Value of --%s: %s\n' 'size' "$_arg_size"
printf 'Value of --%s: %s\n' 'mount' "$_arg_mount"
printf 'Value of --%s: %s\n' 'image' "$_arg_image"

# ^^^  TERMINATE YOUR CODE BEFORE THE BOTTOM ARGBASH MARKER  ^^^

# ] <-- needed because of Argbash
