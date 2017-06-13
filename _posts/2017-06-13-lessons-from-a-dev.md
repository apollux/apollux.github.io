---
layout: post
title: "Lessons from a dev"
date: 2017-06-13
categories: [dev]
tags: []
assets: /assets/2017-lessons-from-a-dev
excerpt_separator: <!--more-->
---
I have been working as a software developer for the last eight years or so. In
this time I have worked at a bunch of different companies in different
industries and environments. Through success and lots of failures I have learned
a lot. In this post I try and share some of those lessons.

<!--more-->

## 1. It is probably your fault...
Developers have the tendency, after investigating a bug, to blame anything or
anybody but their code. I have blamed hardware, Operating Systems, drivers,
third party libraries, or code from colleagues. Guess what, most of time the
bug was in my code. A humbling thought, but once you accept it, it saves you
from going on a ghost hunt in that third party library, when you just should
be looking at your own code.

## 2. Naming things is the hardest thing
When writing code we have to come up with names for a lot of things, functions,
methods, classes, variables etc. Names are perhaps the most import factor in
what makes code readable and easy to understand. Names provide the semantics to
your code, and gives it a context. Without proper names, understanding a piece of
code is an extremely difficult task. Think about those names, care for proper
names and spent time to come up with good names!

## 3. Git everything!
Every thing you write should be under version control, be it a quick script for
this one task, configuration files, or a small test program to try something
new. If it is worth writing it is worth to be under version control. It will
help you tremendously figuring out how a bug got introduced, what config change
caused your program to misbehave, or one year from now figure out why you did
made some change. There is really no reason not to use Git.

I mention Git here, any version control system works, but Git is quick and easy
to create a new repository. Not familiar with Git? Have a look [here][2].

## 4. There is a best way
I once gave a pack of [stroopwafels][1] to a colleague visiting from abroad. The
next day he told me he he had a stroopwafel and really liked it. He also told me
that he searched Google on how to eat a stroopwafel. Than he eat it the proper
way, place the stroopwafel on a hot beverage, and let the syrup in the
stroopwafel heat before eating it. The fact that he went on Google to search for
the best way to eat a cookie baffled me, it a cookie after all.  But he knew
there must be a best way to eat a stroopwafel.

I think this holds true for almost anything, there is a best way to do a
certain thing and someone probably found and described the best way. Here is how
[tie your shoe laces][7] and this is the best way to [make your bed][8]. In the
field of software engineering this holds true as well. There are best practices
identified within the community, idioms for a language or framework that should
be followed. Take your time to search for the best to do things, it almost
always pays off.

## 5. Know your tools
As a developer you will use a lot of software on a daily basis. Operating
systems, IDE, debugger, browser, Wireshark, Git, Bash, SSH you name it. It is
really worth to learn the tools you use. Make use of cheats sheets to learn
shortcuts, check out which plug-ins are available, read tutorials and spent some
time searching online to get the most out of your tools.

I created a quick list on some of the things I use on a daily basis that
are really helpfull to me, yet are not that well known.

* [Chocolatey][3] Package manager for windows.
* [ssh config file][4] Do you use ssh? Check it out.
* [Respeller][5] Spell check plug-in for Resharper.
* [Git-extras][6] Set of useful commands for Git.

Learn your tools! They help you do your job as efficient and effective as
possible. They empower you.

[1]: https://en.wikipedia.org/wiki/Stroopwafel
[2]: http://rogerdudler.github.io/git-guide/
[3]: https://chocolatey.org/
[4]: https://www.digitalocean.com/community/tutorials/how-to-configure-custom-connection-options-for-your-ssh-client
[5]: https://resharper-plugins.jetbrains.com/packages/EtherealCode.ReSpeller/
[6]: https://github.com/tj/git-extras
[7]: https://www.youtube.com/watch?v=nU2OHlbPGaU&t
[8]: https://www.youtube.com/watch?v=DRPfudNNd8Y
