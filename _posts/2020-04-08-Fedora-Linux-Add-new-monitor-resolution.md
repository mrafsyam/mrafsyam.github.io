---           
layout: post
title: fedora / Linux - Add new monitor resolution
date: 2020-04-08 13:09:05 UTC
updated: 2020-04-08 13:09:05 UTC
comments: false
categories: 
---

<div class="tr_bq">Sometimes when you plug in your new monitor, the best fit resolution for it doesn't come out as one of the option in the Display Setting.<br /><br />Use these commands to add new resolution to your monitor</div><blockquote>gtf 1920 1024 60</blockquote><blockquote>xrandr --newmode "1920x1024_60.00"&nbsp; 163.83&nbsp; 1920 2040 2248 2576&nbsp; 1024 1025 1028 1060&nbsp; -HSync +Vsync</blockquote><blockquote>xrandr --addmode DP-1 "1920x1024_60.00"</blockquote>