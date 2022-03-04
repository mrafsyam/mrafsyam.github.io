<h2>Spawn a docker container running ubuntu</h2>

<h3>Create a docker-compose.yml file</h3>
<pre>
version: "3"
services:
  ubuntu:
    container_name: ubuntu
    image: ubuntu
    restart: on-failure
    tty: true
</pre>

<h3>Run it as a service and keep it running</h3>
<pre>
docker-compose up -d
</pre>

<h3>Check your container</h3>
<pre>
$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS              PORTS                               NAMES
92db2d2e58e1   ubuntu    "bash"                   About a minute ago   Up About a minute                                       ubuntu
10a50730c227   mysql     "docker-entrypoint.s…"   3 weeks ago          Up About an hour    33060/tcp, 0.0.0.0:3308->3306/tcp   database-db-1
a52cd313247c   mysql     "docker-entrypoint.s…"   3 weeks ago          Up About an hour    33060/tcp, 0.0.0.0:3307->3306/tcp   weddapp-db-1
</pre>

<h3>Access your container where ubuntu is your container name or container ID</h3>
<pre>
$ docker exec -it ubuntu bash
</pre>

<h3>Copy a directory (i.e. mydir) from host to the container</h3>
On the host, go the directory, perhaps one level above.
Run the following where 92db2d2e58e1 is your container ID
<pre>
docker cp mydir/. 92db2d2e58e1:/mydir
</pre>


<h3>Copy a directory (i.e. mydir) from container to host</h3>
Go the directory in the host where you want the directory to be copied to.
Run the following where 92db2d2e58e1 is your container ID
<pre>
docker cp 92db2d2e58e1:/mydir/. mydir
</pre>
