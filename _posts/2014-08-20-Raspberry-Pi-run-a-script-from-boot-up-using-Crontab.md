---           
layout: post
title: Raspberry Pi - run a script from boot up using Crontab
date: 2014-08-20 19:14:18 UTC
updated: 2014-08-20 19:14:18 UTC
comments: false
categories: 
---

1. First is add a SHEBANG line on top of your python script<br /><span style="font-family: Courier New, Courier, monospace; font-size: large;">#!/usr/bin/env python</span><br /><br />2. Make your script executable with<br /><span style="font-family: Courier New, Courier, monospace; font-size: large;">chmod a+x</span><br /><br />3. Open crontab with<br /><span style="font-family: Courier New, Courier, monospace; font-size: large;">sudo crontab -e</span><br /><br />4. Add the following line. Make sure to include the full path to the script (MyScript.py is the name of your script)<br /><span style="font-family: Courier New, Courier, monospace; font-size: large;">@reboot python /home/pi/Desktop/MyScript.py &amp;</span><br /><br />5. To save these changes click “CTRL-X”, then “Y” and finally “Return”. You should now be back at the command prompt.<br /><br />To start testing you can now reboot