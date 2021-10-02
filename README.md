# gnome-gif-wallpaper
## Use a gif as a GNOME live wallpaper
*ggw.sh* is a small bash script to set a gif as a live wallpaper on GNOME. It works very simply by looping through a directory of the frames of a gif, setting the wallpaper to be one frame and then the next.

### Notice
This script is not an efficient use of system resources. This script is just for fun; test it on your machine first to see if you can afford the CPU usage loss.

I have noticed that there is a black flashing effect when you first run the script, which seems to resolve itself after the first loop through all frames of the gif.

### Instructions on how to use
First, you need to turn off GNOME animations using the command
```
gsettings set org.gnome.desktop.interface enable-animations false
```
If you don't, GNOME will attempt to use a 'fade-from-black' animation when changing the wallpaper (which is effectively all this script does), which will distort the gif and make it lose resolution. Unfortunately, this will disable all GNOME animations, but it is the only solution I've found so far in preventing this 'fade-from-black'.

This command can be undone with
```
gsettings set org.gnome.desktop.interface enable-animations true
```
Then clone this repository
```
git clone https://github.com/stephpavlou/gnome-gif-wallpaper
```
From there, run the following command to make the bash script executable
```
chmod +x ggw.sh
```
At this point, you should be able to test out the script like so
```
./ggw.sh /absolute/path/to/gif 0.04s
```
Note that the '/absolute/path/to/gif' value should not be the path to a .gif file, but rather a directory holding the individual FRAMES of a gif you would like to use as a live wallpaper. This can be done easily using the online tool https://ezgif.com/split. The '0.04s' value should be the time the script should sleep in between frames. This will be different for every gif.

Some gifs are provided as examples; these can be found in the 'gif' directory.
