#!/bin/bash

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.10.0
# ARG_OPTIONAL_SINGLE([device], [d], [Device that will be formatted])
# ARG_OPTIONAL_SINGLE([size], [s], [Size of boot/rescue partition])
# ARG_OPTIONAL_SINGLE([mount], [m], [Directory that will be used to mount devices and images])
# ARG_OPTIONAL_SINGLE([image], [i], [Image with pre-system content])
# ARG_HELP([The general script's help msg])
# ARGBASH_GO

# [ <-- needed because of Argbash

# vvv  PLACE YOUR CODE HERE  vvv
# For example:
printf 'Value of --%s: %s\n' 'length' "$_arg_length"
printf "'%s' is %s\\n" 'verbose' "$_arg_verbose"
printf "Value of '%s': %s\\n" 'character' "$_arg_character"

# ^^^  TERMINATE YOUR CODE BEFORE THE BOTTOM ARGBASH MARKER  ^^^

# ] <-- needed because of Argbash
