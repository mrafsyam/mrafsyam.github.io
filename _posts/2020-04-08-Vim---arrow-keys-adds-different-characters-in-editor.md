I had this problem sometimes on my application server, which can sometimes be old machines. When I tried to use arrow keys in insert mode in vim editor the following characters are being inserted in the editor:

for ↓ I get B
for ↑ I get A
for ← I get D
for → I get C

...and it's super annoying.

From what I found out, this is how the original Vi behaves.

However, VIM is the successor to Vi. By default, it set to be in Vi-compatible mode, which includes this behavior for the arrow keys.

To remove the compatible mode, create a file named .vimrc in home directory add this line to the top of the file:
<pre>
vim  ~/.vimrc
set nocompatible
</pre>

Save the file and this should fix the problem.
