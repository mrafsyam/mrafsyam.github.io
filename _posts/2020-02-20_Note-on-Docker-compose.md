---           
layout: post
title: Note on Docker Compose
date: 2022-02-20 12:57:29 UTC
updated: 2022-02-20 12:57:29 UTC
comments: true
categories:
---

<h2>Spawn a docker container running ubuntu

<h3>Create a docker-compose.yml file
<pre>
version: "3"
services:
  ubuntu:
    container_name: ubuntu
    image: ubuntu
    restart: on-failure
    tty: true
</pre>

<h3>Run it as a service and keep it running
<pre>
docker-compose up -d
</pre>

<h3>Check your container
<pre>
$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS              PORTS                               NAMES
92db2d2e58e1   ubuntu    "bash"                   About a minute ago   Up About a minute                                       ubuntu
10a50730c227   mysql     "docker-entrypoint.s…"   3 weeks ago          Up About an hour    33060/tcp, 0.0.0.0:3308->3306/tcp   database-db-1
a52cd313247c   mysql     "docker-entrypoint.s…"   3 weeks ago          Up About an hour    33060/tcp, 0.0.0.0:3307->3306/tcp   weddapp-db-1
</pre>

<h3>Access your container where ubuntu is your container name or container ID
<pre>
$ docker exec -it ubuntu bash
</pre>