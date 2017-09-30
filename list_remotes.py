#!/usr/bin/env python

import datetime

from git import Repo

repo = Repo()

ready_branches = [(x.name, x.object.author.name, x.object.committed_date) for x in repo.remotes["origin"].refs if "origin/ready" in x.name]

for x in sorted(ready_branches, key=lambda x: x[1]):
    print u"{}, {:20}: {}".format(datetime.datetime.fromtimestamp(int(x[2])), x[1], x[0])
