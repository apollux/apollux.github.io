---
layout: post
title: "Lessons learned from 6 months of using Docker"
date: 2017-09-27
categories: []
tags: []
assets: /assets/2017-lessons-learned-from-6-months-of-using-docker
excerpt_separator: <!--more-->
---
For the last half year I have been using Docker to deploy an application based
on micro services. I learned a thing or two in this period which I try to share
in this post. A lot has been written on using Docker and best practices. I still
decided to write this since I encountered a thing or two I did not see coming.

<!--more-->

# You probably should not use binding mounts in production

Docker allows you to mount files or directories from your host system in your
container. This can be used to make configuration available in your container.
In my situation I had configuration of a Logstash pipeline in a repository on my
host system and mounted the configuration in a Logstash container. This works
just fine. However, the moment you want to scale your application to make use
of multiple machines to run the Docker stack, you run into issues.

The files that needs to be mounted in a container, have to present on the host
that runs that container. This makes your deployment more complex, especially
when using multiple host in a swarm.

Another problem with mounting files in a container touches on one of the main
principles of Docker and containerization in general. A container should contain
an application along with al of its dependencies. This way a container that
runs correct in a test environment should also run without problems in
production. When an application (or component, micro service, or however you want
to call it) needs a configuration file to work, that configuration should be
part of image.

Of course, you most likely will have some configuration which differs between
test and production environments, like IP addresses or host names. A common
approach to configure these is through environment variables. Environment
variables are very well supported in the Docker eco-system and offer quite some
flexibility.

Alternatively [configs][1] from Docker Swarm can be used to create, share and 
update configuration of your Docker Swarm services. However, consider what
configuration you put in these configs and favor configuration that is part of
your image.

# Take continuous integration to the max!
The process of creating a Dockerfile, putting it under version control,
building the actual image, and pushing it to a registry sounds like a lot of of
work. However all those tasks can be automated quite easily. With some
scripting and a buildserver like Jenkings, you can take this to the point where
a commit on a repository, results in a new image being build, the application
being deployed on a test environment and automated tests being run.

This approach simplifies the whole process drastically and removes all barriers
of using Docker images to deploy your application.

# Docker on Windows is not production ready
I started out using Docker on Windows for the application I worked on. This
might not be the most obvious decision, after all Docker originates from the
Linux eco-system. However part of the server application still had to be
deployed as Windows service for the time being. therefor Docker on Windows made
sense. After some months the switch to CoreOS was made for a plethora of
reasons...

Docker on Windows is buggy. There I said it. I have observed random crashes and
a lot of weird things. Settings that get reverted to default for no obvious
reason. The GUI indicating 10GB of RAM allocated while in practice the virtual
machine only had 2GB. And I don't know how many times I have [re-installed the
Filesharing service][2] on my network adapter to fix file sharing.

Updates to Docker on Windows are released quite frequently, so the situation
described above can change quickly, but for now I would stronly advise against
using Docker on Windows.

[1]: https://docs.docker.com/engine/swarm/configs/
[2]: https://stackoverflow.com/questions/42203488/settings-to-windows-firewall-to-allow-docker-for-windows-to-share-drive

