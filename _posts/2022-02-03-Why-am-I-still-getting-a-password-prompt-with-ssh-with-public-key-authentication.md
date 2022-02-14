---           
layout: post
title: Why am I still getting a password prompt with ssh with public key authentication
date: 2022-02-03 21:45:19 UTC
updated: 2022-02-03 21:45:19 UTC
comments: false
categories: 
---

Following this tutorial : http://www.linuxproblem.org/art_9.html<br /><br />Why am I still getting a password prompt with ssh with public key authentication?<br /><br />Make sure the permissions on the ~/.ssh directory and its contents are proper. Create .ssh folder if it's not there yet. Same goes to authorized_keys file.<br /><br />Your home directory ~, your ~/.ssh directory and the ~/.ssh/authorized_keys file on the remote machine must be writable only by you:<br />rwx------ and rwxr-xr-x are fine, but rwxrwx--- is no good.<br />700 or 755, not 775<br /><br />If ~/.ssh or authorized_keys is a symbolic link, the canonical path (with symbolic links expanded) is checked.<br /><br />Your ~/.ssh/authorized_keys file (on the remote machine) must be readable (at least 400) but you probably need it to be also writable (600) if you will add any more keys to it.<br /><br />Your private key file (on the local machine) must be readable and writable only by you: rw-------, i.e. 600.<br /><br />Also, if SELinux is set to enforcing, you may need to run restorecon -R -v ~/.ssh (see e.g. Ubuntu bug 965663 and Debian bug report #658675; this is patched in CentOS 6).