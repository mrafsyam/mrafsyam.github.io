---           
layout: post
title: Creating a new Github repository and link it to the local existing project in your computer
date: 2016-09-20 19:45:18 UTC
updated: 2016-09-20 19:45:18 UTC
comments: false
categories: 
---

1. Create a new repository on GitHub<br /><br />2. Get the remote repository Web URL by pressing the "Clone or Download" button (coloured green). It looks like this : <span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">https://github.com/iserifith/ScoreBoard.git</span><br /><br />3. Open Terminal and go to your local project folder where you have the files you have been working on.<br /><br />4. Initialize the local project folder as a Git repository using the following command :<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git init</span><br /><br />5. Add the files in the project folder into "local git repository" - this is called "staging".<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git add .</span><br /><br />Note : This does not connect to "remote git repository". Understand the difference between local and remote git repository.<br /><br />6. Commit the files that you've staged in your local repository.<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git commit -m "First commit"</span><br /><br />7. Now we set so that our local repository are linked to the remote repository. This command set the remote repository as the "origin".<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git remote add origin {remote repository Web URL}</span><br /><br />Example : <span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git remote add origin https://github.com/iserifith/ScoreBoard.git</span><br /><br />8. Verify that our remote repository are linked properly using<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git remote -v</span><br /><br />It will prompt you something like this :<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">origin<span class="Apple-tab-span" style="white-space: pre;"> </span>https://github.com/iserifith/ScoreBoard.git (fetch)</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">origin<span class="Apple-tab-span" style="white-space: pre;"> </span>https://github.com/iserifith/ScoreBoard.git (push)</span><br /><div><br /></div>9. Once all set, push the all files (that we have committed just now) in your local repository to GitHub using the following command :<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git push origin master</span><br /><br /><br /><br /><b><span style="font-size: large;">Extra :</span></b><br />Now, to make sure you keep updated Github with your work, all you need to are 3 steps :<br /><br />1. Add all files (staging)<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git add .</span><br /><br />2. Commit<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git commit -m "I did some changes"</span><br /><br />3. Push to Github (remote repository)<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">git push origin master</span>