---           
layout: post
title: Python server is now working
date: 2014-09-05 11:21:48 UTC
updated: 2014-09-05 11:21:48 UTC
comments: false
categories: 
---

<a href="http://smarteac.blogspot.com/2013/07/installing-python-26-and-pybluez-on-rpi.html">Earlier</a>, we have a problem in sending the data from the Android App to the Python server on Rpi. I wrote:<br /><br />"On Rpi, the App shown that connection has been made with the server and data has been successfully sent, but none of those are indicated on the server that I ran"<br /><span style="text-align: center;"><br /></span><span style="text-align: center;">Well, I was half correct and half wrong.</span><br /><br />Based on this <a href="http://stackoverflow.com/questions/17216264/bluetooth-connection-between-android-and-linux-rpi-lost-on-first-write-action">thread</a>, the problem lies in the default configuration of Bluez where pnat plugin (a plugin file written in c for Nokia's Maemo platform) is enabled. The plugin effectively breaks any application that tries to run Rfcomm server. Running the App through Eclipse shows "connection reset by peer" error even though initially connection was made. So, the connection was initially made, but it is then terminated by the plugin right at the point where data is to be send.<br /><br />To fix this, just disable pnat plugin. <br />1. Navigate to &nbsp;"<span style="font-family: Courier New, Courier, monospace;">/etc/bluetooth/main.conf</span>" <br />2. Edit the file with root "<span style="font-family: Courier New, Courier, monospace;">sudo nano main.conf</span>"<br />3. Append the following&nbsp;"<span style="font-family: Courier New, Courier, monospace;">DisablePlugins = pnat</span>" in the <span style="font-family: Courier New, Courier, monospace;">main.conf</span> file. <br />4. Save and Exit - Press 'CTRL-X' and 'Enter'<br />5. Restart bluetooth by issuing "<span style="font-family: Courier New, Courier, monospace;">sudo invoke-rc.d bluetooth restart</span>"<br /><br /><div class="separator" style="clear: both; text-align: center;"><a href="http://1.bp.blogspot.com/-PBm53nvm7bA/UfrC8nitJII/AAAAAAAAAlk/JLKXg3FdQAk/s1600/wdwdwdw.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em; text-align: center;"><img border="0" height="300" src="http://1.bp.blogspot.com/-PBm53nvm7bA/UfrC8nitJII/AAAAAAAAAlk/JLKXg3FdQAk/s400/wdwdwdw.jpg" width="400" /></a></div><br /><br />