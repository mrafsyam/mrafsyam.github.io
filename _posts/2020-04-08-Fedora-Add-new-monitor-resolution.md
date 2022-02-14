Sometimes when you plug in your new monitor, the best fit resolution for it doesn't come out as one of the option in the Display Setting.

Use these commands to add new resolution to your monitor, modify the resolution to what you need :

<pre>
gtf 1920 1024 60

xrandr --newmode "1920x1024_60.00"  163.83  1920 2040 2248 2576  1024 1025 1028 1060  -HSync +Vsync

xrandr --addmode DP-1 "1920x1024_60.00"
</pre>
