export RESULT=$(pkexec virsh start win10 2>&1 >/dev/null)  && notify-send "$RESULT"
