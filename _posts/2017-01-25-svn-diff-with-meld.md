---           
layout: post
title: svn diff with meld
date: 2017-01-25 07:28:14 UTC
updated: 2017-01-25 07:28:14 UTC
comments: false
categories: 
---

<b>How to use svn diff with meld</b><br /><br />1. First, download meld from here and set the path to <b>/bin </b>folder of meld to <b>$PATH</b> variables.<br /><br />2. Create a script of below content with name <b>meld-diff.sh</b><br /><b><br /></b><span style="font-family: Courier New, Courier, monospace;">#!/bin/bash</span><br /><span style="font-family: Courier New, Courier, monospace;">meld "$6" "$7"&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;"></span><br /><span style="font-family: Courier New, Courier, monospace;">exit 0</span><br /><br />3. Copy the location, lets say its <b>/home/you/meld-diff.sh</b><br /><br />4. Edit subversion configuration file. Found in <b>/home/you/.subversion/config</b><br />Search for "<b>diff-cmd</b>", uncomment it and set it to path of our script we created just now. Save it.<br /><br />For example :&nbsp;<b>diff-cmd = /home/you/meld-diff.sh</b><br /><br />5. Now if you run "<b>svn diff"</b>, it should redirect to meld automatically.