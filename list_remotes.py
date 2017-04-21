#!/usr/bin/env python

from git import Repo

repo = Repo()

for x in [(x.name, x.object.author.name) for x in repo.remotes["origin"].refs if "origin/ready" in x.name]:
    print u"{:20}: {}".format(x[1], x[0]).encode('utf-8')
