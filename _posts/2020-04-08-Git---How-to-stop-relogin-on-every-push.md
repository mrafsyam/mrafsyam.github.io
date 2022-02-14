Lets permanently authenticating with Git repositories using username and password.

Run following command to enable credential caching:

<pre>
$ git config credential.helper store
</pre>

Afterwards, make some changes, commit and try with git push.

No more relogin.
