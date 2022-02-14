---           
layout: post
title: Adding to environment PATH in Linux
date: 2015-03-21 08:27:22 UTC
updated: 2015-03-21 08:27:22 UTC
comments: false
categories: 
---

<span style="font-family: Arial, Helvetica, sans-serif;">To add any application binaries to PATH, modify the application folder path.</span><span style="font-family: Courier New, Courier, monospace;"><br /></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; export PATH=$PATH:/opt/apps</span><br /><span style="font-family: 'Courier New', Courier, monospace;">&nbsp; &nbsp; export PATH=$PATH:/home/bin</span><br /><span style="font-family: 'Courier New', Courier, monospace;">&nbsp; &nbsp; export PATH=$PATH:/home/raf/Android/Sdk/platform-tools</span><br /><br /><span style="font-family: Arial, Helvetica, sans-serif;">&nbsp;To see what's in PATH, use</span><br /><span style="font-family: Arial, Helvetica, sans-serif;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style="font-family: 'Courier New', Courier, monospace;">echo $PATH</span>