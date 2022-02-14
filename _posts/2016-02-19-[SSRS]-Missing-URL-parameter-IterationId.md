---           
layout: post
title: SSRS Missing URL parameter - IterationId
date: 2016-02-19 07:06:31 UTC
updated: 2016-02-19 07:06:31 UTC
comments: false
categories: 
---

Your SSRS report previewed well on Visual Studio but when publishing it, you were prompted with the following error:<br /><br /><div><span style="font-family: Courier New, Courier, monospace;">Error caught in Application_Error event:</span></div><div><span style="font-family: Courier New, Courier, monospace;">Microsoft.Reporting.WebForms.HttpHandlerInputException: Missing URL parameter: IterationId</span><br /><br />To go around this, add your site to "Compatibility View Setting" of your Internet Explorer and voila!<br /><br /></div><div class="separator" style="clear: both; text-align: center;"><a href="https://4.bp.blogspot.com/-hhhaDgzY6ag/VsaIaT4ud8I/AAAAAAAABTk/_P_4k9nlafo/s1600/1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="320" src="https://4.bp.blogspot.com/-hhhaDgzY6ag/VsaIaT4ud8I/AAAAAAAABTk/_P_4k9nlafo/s320/1.png" width="247" /></a></div><div class="separator" style="clear: both; text-align: center;"><br /></div><div class="separator" style="clear: both; text-align: center;"><a href="https://1.bp.blogspot.com/-y_KWUmdeelk/VsaIoEP-NSI/AAAAAAAABTo/ewUiZNzZZ_w/s1600/2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="320" src="https://1.bp.blogspot.com/-y_KWUmdeelk/VsaIoEP-NSI/AAAAAAAABTo/ewUiZNzZZ_w/s320/2.png" width="267" /></a></div><div class="separator" style="clear: both; text-align: center;"><br /></div>