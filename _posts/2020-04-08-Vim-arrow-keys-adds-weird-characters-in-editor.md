---           
layout: post
title: vim arrow keys adds characters in editor
date: 2020-04-08 13:07:09 UTC
updated: 2020-04-08 13:07:09 UTC
comments: false
categories: 
---

I had this problem sometimes on my application server, which can sometimes be old machines. When I tried to use arrow keys in insert mode in vim editor the following characters are being inserted in the editor:<br /><br /><br /><ul><li>for ↓ I get B</li><li>for ↑ I get A</li><li>for ← I get D</li><li>for → I get C</li></ul><div>...and it's super annoying.</div><br /><div>From my reading, this is how Vi behaves.</div><div><div><br /></div><div>However, VIM is the successor to Vi. By default, it set to be in Vi-compatible mode, which includes this behavior for the arrow keys.<br /><br />To remove the compatible mode, create a file named .vimrc in home directory add this line to the top of the file:</div><blockquote class="tr_bq"><br />vim&nbsp; ~/.vimrc<br />set nocompatible</blockquote><div><br /></div><div>Save the file and this should fix the problem.</div></div>