pid=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.type=="con") | select(.focused==true).pid')
ppid=$(pgrep --newest --parent ${pid})
path=$(readlink /proc/${ppid}/cwd || echo $HOME)
echo $path
foot -D $path
