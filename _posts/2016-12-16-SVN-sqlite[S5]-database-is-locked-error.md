---           
layout: post
title: SVN : sqlite[S5]: database is locked error
date: 2016-12-16 02:53:36 UTC
updated: 2016-12-16 02:53:36 UTC
comments: false
categories: 
---

Once in a while I get this error, happened due to network issue while a svn command is being executed but wasn't able to finish. <br /><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">svn: E200033: Another process is blocking the working copy database, or the underlying filesystem does not support file locking; if the working copy is on a network filesystem, make sure file locking has been enabled on the file server&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">svn: E200033: sqlite[S5]: database is locked&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">svn: E200042: Additional errors:&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">svn: E200033: sqlite[S5]: database is locked </span><br /><br />Fix : <br /><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">$ cd /my/repository/.svn&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">$ mv wc.db wc.db.old&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">$ sqlite3 wc.db.old&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">sqlite&gt; .backup main wc.db</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">sqlite&gt; .exit</span><br /><br />Afterwards, do a svn cleanup. Then, you're good to go.