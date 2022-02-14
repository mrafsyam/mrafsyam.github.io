---           
layout: post
title: Tomcat - clearing cache
date: 2016-07-22 09:41:35 UTC
updated: 2016-07-22 09:41:35 UTC
comments: false
categories: 
---

I was doing some works with Tomcat on my current Debian setup and this one issue keeps bugging me the whole day. Today is Friday and lucky for me, I was able to get some times away from that and cleared my mind before getting back at it.<br /><br />After returning (soaked in wet rain), I came to the conclusion that Tomcat cached some of the apps that I deployed somewhere. This means that re-deploying the apps does not really load up the entirely new App properly as a whole.<br /><br />Before that, I have checked and did the following, which seemingly "removed" the previous deployment.<br /><br /><span class="Apple-tab-span" style="white-space: pre;"> </span>| Remove the contents of the folder $CATALINA_HOME/work<br /><br />Well, that worked for basic UI changes that I made, until I needed to re-point the apps to my local database. In my App, there is a config/properties file that handles this. I made changes to the file, and guess what?<br /><br />The databases connection was unsuccessful...<br /><br />It seems that Tomcat still does some cache-ing somewhere....<br /><br />and then I found out the solution :<br /><br />Change the content of the following file : $CATALINA_HOME/conf/context.xml<br /><br />Add inside the <context> tag <context> :&nbsp;</context></context><br />&nbsp; &nbsp; &nbsp; <resources antiresourcelocking="false" cachingallowed="false"> <resources antiresourcelocking="false" cachingallowed="false"></resources></resources><br /><br />and that solves my issues.