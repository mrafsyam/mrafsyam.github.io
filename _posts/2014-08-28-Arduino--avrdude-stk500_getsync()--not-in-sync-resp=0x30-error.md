---           
layout: post
title: Arduino: avrdude stk500_getsync(): not in sync resp=0x30 error 
date: 2014-08-28 20:52:51 UTC
updated: 2014-08-28 20:52:51 UTC
comments: false
categories: 
---

1. Make sure you have Arduino driver installed correctly (serial com is working)<br /><br />2. Make sure serial port is correct<br /><br />3. When uploading the sketch, make sure there is no connection at Tx (pin0) and Rx (pin1)