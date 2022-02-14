---           
layout: post
title: Unlocking - sending keys and verification
date: 2014-09-05 11:21:48 UTC
updated: 2014-09-05 11:21:48 UTC
comments: false
categories: 
---

<div class="separator" style="clear: both; text-align: center;"></div>In the last meeting, we discussed on how we can implement the verification of the key in the most efficient way, while not risking the security aspect of the system. <br /><br />We agreed that we would be implementing a distance measuring mechanism (I'll write about it in another post), in which the door is to be set "ready to be unlocked" only when the user is within the safe distance from the door (2-3 meters). <br /><br />This adds another type of verification which is the <i>distance between the user and the Rpi&nbsp;</i>itself.<br /><br /><div class="separator" style="clear: both; text-align: center;"><a href="http://4.bp.blogspot.com/-Fow_Fx1vjws/UlZ_phhge2I/AAAAAAAAAyc/2pgSaNEVook/s1600/Untitled+drawing+(2).jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="640" src="http://4.bp.blogspot.com/-Fow_Fx1vjws/UlZ_phhge2I/AAAAAAAAAyc/2pgSaNEVook/s640/Untitled+drawing+(2).jpg" width="542" /></a></div><div class="separator" style="clear: both; text-align: center;">The figure above shows how Rpi is used to validates both 'distance' and 'key'. Alternatively, 'distance' can be validated via the Android App itself.</div><br /><div class="separator" style="clear: both; text-align: center;"></div>