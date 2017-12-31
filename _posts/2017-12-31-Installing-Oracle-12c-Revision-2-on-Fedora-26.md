This writing is based on this [article](https://oracle-base.com/articles/12c/oracle-db-12cr2-installation-on-fedora-26) which I followed. However, the steps mentioned were somewhat not in order and some issues tackled were not described properly (at least to me). Please also note that these steps are very specific to Fedora 26. I don't guaranteed that it will work on other distro or other Fedora or Oracle version.

1. First of all, download the installation files
[OTN: Oracle Database 12c Release 2 (12.2.0.1) Software (64-bit).](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html)

2. Create appropiate Linux groups and users. Set the password for Linux user oracle.

```
groupadd -g 54321 oinstall
groupadd -g 54322 dba
groupadd -g 54323 oper
sudo useradd -u 54321 -g oinstall -G dba,oper oracle
passwd oracle
```

3. Create the appropiate directories for Oracle. Note that the installation can be anywhere, but for simplicity sake, lets just use Oracle typical directory structure.

```
mkdir -p /u01/app/oracle/product/12.2.0.1/db_1
mkdir -p /u01/software
sudo chown -R oracle:oinstall /u01
sudo chmod -R 775 /u01
```

4. Unzip the installation files from (1) to folder "/u01/software/database". This will be our installer folder.
    
`unzip linuxx64_12201_database.zip database`

5. Setup the host file. Edit the "/etc/hosts" file to add a fully qualified name to our machine. Note that keep everything in one line. For example, (a) below doesn't work for me, but (b) does. Ensure the file is saved correctly by running `hostname`

```
    (a)
    127.0.0.1       localhost localhost.localdomain localhost4 localhost4.localdomain4
    192.168.56.141  fedora26.localdomain  fedora26 ```

    (b)
    127.0.0.1   localhost 
    127.0.0.1   localhost.localdomain 
    127.0.0.1   fedora26.localdomain
```

6. Set the kernel parameters. Add the following lines to the "/etc/sysctl.conf" file.

``` 
fs.file-max = 6815744
    kernel.sem = 250 32000 100 128
    kernel.shmmni = 4096
    kernel.shmall = 1073741824
    kernel.shmmax = 4398046511104
    kernel.panic_on_oops = 1
    net.core.rmem_default = 262144
    net.core.rmem_max = 4194304
    net.core.wmem_default = 262144
    net.core.wmem_max = 1048576
    net.ipv4.conf.all.rp_filter = 2
    net.ipv4.conf.default.rp_filter = 2
    fs.aio-max-nr = 1048576
    net.ipv4.ip_local_port_range = 9000 65500 
```

Run this to apply the changes `/sbin/sysctl -p`

Add the following lines to a file called "/etc/security/limits.d/oracle-database-server-12cR2-preinstall.conf" file.

``` oracle   soft   nofile    1024
    oracle   hard   nofile    65536
    oracle   soft   nproc    16384
    oracle   hard   nproc    16384
    oracle   soft   stack    10240
    oracle   hard   stack    32768
    oracle   hard   memlock    134217728
    oracle   soft   memlock    134217728 ```

7. Stop and disable firewall

``` systemctl stop firewalld
    systemctl disable firewalld ```

8. Set SELinux to permissive by editing the "/etc/selinux/config" file, making sure the SELINUX flag is set as follows : `SELINUX=permissive`

9. Now, reboot the machine to ensure all changes we made so far are applied.

10. Login as the Linux user oracle that we created in (2) : `su - oracle`

11. Ensure all packages needed are installed. Just copy and paste these on terminal and install them.

Package group
    
``` sudo dnf groupinstall "Development Tools" -y
    sudo dnf groupinstall "Administration Tools" -y
    sudo dnf groupinstall "System Tools" -y ```

The required packages, including the 32-bit version of some of the packages. Many of the packages should be installed already.

``` sudo dnf install binutils -y
    sudo dnf install compat-libcap1 -y
    sudo dnf install compat-libstdc++-33 -y
    sudo dnf install compat-libstdc++-33.i686 -y
    sudo dnf install glibc -y
    sudo dnf install glibc.i686 -y
    sudo dnf install glibc-devel -y
    sudo dnf install glibc-devel.i686 -y
    sudo dnf install ksh -y
    sudo dnf install libaio -y
    sudo dnf install libaio.i686 -y
    sudo dnf install libaio-devel -y
    sudo dnf install libaio-devel.i686 -y
    sudo dnf install libX11 -y
    sudo dnf install libX11.i686 -y
    sudo dnf install libXau -y
    sudo dnf install libXau.i686 -y
    sudo dnf install libXi -y
    sudo dnf install libXi.i686 -y
    sudo dnf install libXtst -y
    sudo dnf install libXtst.i686 -y
    sudo dnf install libgcc -y
    sudo dnf install libgcc.i686 -y
    sudo dnf install libstdc++ -y
    sudo dnf install libstdc++.i686 -y
    sudo dnf install libstdc++-devel -y
    sudo dnf install libstdc++-devel.i686 -y
    sudo dnf install libxcb -y
    sudo dnf install libxcb.i686 -y
    sudo dnf install make -y
    sudo dnf install nfs-utils -y
    sudo dnf install net-tools -y
    sudo dnf install smartmontools -y
    sudo dnf install sysstat -y
    sudo dnf install unixODBC -y
    sudo dnf install unixODBC-devel -y ```

12. Edit the release file. Edit the "/etc/redhat-release" file replacing the current release information "Fedora release 26 (Twenty Six)" with the following.

    `redhat release 7`

13. Edit the bashrc file of the oracle user : `vim ~/.bashrc`. Ensure the hostname is according to what you set in (5). 

``` export TMP=/tmp
	export TMPDIR=$TMP
	export ORACLE_HOSTNAME=fedora26.localdomain
	export ORACLE_UNQNAME=cdb1
	export ORACLE_BASE=/u01/app/oracle
	export ORACLE_HOME=$ORACLE_BASE/product/12.2.0.1/db_1
	export ORACLE_SID=cdb1
	export PATH=/usr/sbin:$PATH
	export PATH=$ORACLE_HOME/bin:$PATH
	export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
	export CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib ```

14. There is a bug that requires us to relink some of the libraries used by Oracle. This is probably the cause of error that prompts "TNS : Lost contact" that is typically faced during Oracle installation.
	
``` cd $ORACLE_HOME/lib/stubs
	mkdir BAK
	mv libc* BAK/
	$ORACLE_HOME/bin/relink all ```

15. Run the installer in GUI mode. Ensure that you set the password for administator and jot it down.
    
``` cd /u01/software/database
    ./runInstaller ```

If you're faced with the error mentioned in 14, what you probably have is Oracle software installed, but database was not created. Moving forward, do again step 14 and afterwards, follow the next step. If you don't face the error, skip the next step - you probably have database created successfully already. 

16. Create database. Run : `dbca`

17. If you're faced with not enough space error, delete the installation zip files downloaded in (1).

18. By now, the database should be succesfully installed. In short, there are 2 things that we need to check to ensure our Oracle database is running correctly, the first one is the Oracle database instance and the other one is the Oracle listener. 

19. To ensure the Oracle database instance is running, check it using Sqlplus.

``` sqlplus / as sysdba
    startup ```

You should see something like this :
	
``` ORACLE instance started.
	Total System Global Area 2483027968 bytes
	Fixed Size		    8795808 bytes
	Variable Size		  687868256 bytes
	Database Buffers	 1778384896 bytes
	Redo Buffers		    7979008 bytes
	Database mounted.
	Database opened. ```

20. To ensure that the listener is running, run :

    `lsnrctl status`

or you can restart the listener 

``` lsnrctl stop
    lsnrctl start ```

You should see something like this :
	
``` LSNRCTL for Linux: Version 12.2.0.1.0 - Production on 31-DEC-2017 21:22:40

	Copyright (c) 1991, 2016, Oracle.  All rights reserved.

	Starting /u01/app/oracle/product/12.2.0.1/db_1/bin/tnslsnr: please wait...


	LSNRCTL for Linux: Version 12.2.0.1.0 - Production on 31-DEC-2017 21:22:15

	Copyright (c) 1991, 2016, Oracle.  All rights reserved.

	Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=fedora26.localdomain)(PORT=1521)))
	STATUS of the LISTENER
	------------------------
	Alias                     LISTENER
	Version                   TNSLSNR for Linux: Version 12.2.0.1.0 - Production
	Start Date                31-DEC-2017 19:52:50
	Uptime                    0 days 1 hr. 29 min. 26 sec
	Trace Level               off
	Security                  ON: Local OS Authentication
	SNMP                      OFF
	Listener Parameter File   /u01/app/oracle/product/12.2.0.1/db_1/network/admin/listener.ora
	Listener Log File         /u01/app/oracle/diag/tnslsnr/fedora26/listener/alert/log.xml
	Listening Endpoints Summary...
	  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=fedora26.localdomain)(PORT=1521)))
	  (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC1521)))
	  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcps)(HOST=fedora26.localdomain)(PORT=5500))(Security=(my_wallet_directory=/u01/app/oracle/admin/orcl/xdb_wallet))(Presentation=HTTP)(Session=RAW))
	Services Summary...
	Service "619541c6fa4e61e3e0530100007f47e3" has 1 instance(s).
	  Instance "orcl", status READY, has 1 handler(s) for this service...
	Service "orcl" has 1 instance(s).
	  Instance "orcl", status READY, has 1 handler(s) for this service...
	Service "orclXDB" has 1 instance(s).
	  Instance "orcl", status READY, has 1 handler(s) for this service...
	Service "orclpdb" has 1 instance(s).
	  Instance "orcl", status READY, has 1 handler(s) for this service...
	The command completed successfully ```

21. I had some issues where the listener just couldn't reach out the running database instance. To rectify this, shutdown the instance and restart it back using sqlplus

``` sqlplus / as sysdba
    SQL> shutdown
    SQL> startup ```

Afterwards, check if the listener is picking up the instance by `lsnrctl status`

22. That's it. You may want to create some tablespace, some new users to try out your local Oracle database using any database client. I use Dbeaver. Good luck!!