#!/bin/bash
# Instructions on how to run:
# 1. Use the command 'chmod +x ggw.sh' to make the script
#	 executable.
# 2. Invoke the executable like so:
#	 './ggw.sh path/to/gif 0.07s'
#	 Note that 'path/to/gif' should be the absolute path
#	 of the directory holding the FRAMES of the gif you
#	 want to use as your wallpaper. You can easily split
#	 a gif into its individual frames using
#	 https://ezgif.com/split. The second thing you should
#	 pass to this script, '0.07s', is the time the script
#	 should sleep in between frames.

gif_path=$1
sleep_time=$2

num_frames=$(ls $gif_path -1q | wc -l)

counter=1
while true
do
	file_num=$(($counter % ($num_frames + 1)))

	if [ $file_num -eq 0 ]
	then
		file_num=1
	fi

	file_to_display=$(ls $gif_path | awk "NR==$file_num")
	gsettings set org.gnome.desktop.background picture-uri "file:///$gif_path/$file_to_display" 
	
	sleep $sleep_time
	((counter++))
done
