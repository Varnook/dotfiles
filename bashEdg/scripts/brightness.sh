cd $HOME/.bashscripts/
number=`python "brightness.py" "$1" "$(cat savedBright)"`
echo $number > savedBright
xrandr --output eDP-1 --brightness $number
