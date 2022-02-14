---           
layout: post
title: MySQL Error 1215: Cannot add foreign key constraint
date: 2017-01-10 04:42:18 UTC
updated: 2017-01-10 04:42:18 UTC
comments: false
categories: 
---

<div style="background-color: white; border: 0px; clear: both; color: #242729; font-family: Arial, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 15px; margin-bottom: 1em; padding: 0px;">As a newbie, I was confused on this error until I search through StackOverflow. Phew!<br /><br />Reasons you may get a foreign key constraint error:</div><ul><li style="border: 0px; margin: 0px 0px 0.5em; padding: 0px; word-wrap: break-word;">You are not using InnoDB as the engine on all tables.</li><li style="border: 0px; margin: 0px 0px 0.5em; padding: 0px; word-wrap: break-word;">You are trying to reference a nonexistent key on the target table. Make sure it is a&nbsp;<em style="border: 0px; margin: 0px; padding: 0px;">key</em>&nbsp;on the other table (it can be a primary or unique key)</li><li style="border: 0px; margin: 0px; padding: 0px; word-wrap: break-word;">The types of the columns are not the same (exception is the column on the referencing table can be nullable).<br /></li><li style="border: 0px; margin: 0px; padding: 0px; word-wrap: break-word;">One of the reasons may also be that the column you are using for&nbsp;<code style="background-color: #eff0f1; border: 0px; font-family: Consolas, Menlo, Monaco, &quot;Lucida Console&quot;, &quot;Liberation Mono&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, monospace, sans-serif; font-size: 13px; margin: 0px; padding: 1px 5px; white-space: pre-wrap;">ON DELETE SET NULL</code>&nbsp;is not defined to be null. So make sure that the column is set default null<br /></li><li style="border: 0px; margin: 0px; padding: 0px; word-wrap: break-word;">You are not using the same Character Set for both tables.</li></ul>