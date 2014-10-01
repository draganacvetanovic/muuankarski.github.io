---
layout: default
title: "jekyll"
author: "Markus Kainu"
date: "24.08.2014"
---



Pushaa masteri sekä maste että gh-pages brancheihin


```r
[core]
  repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = git@github.com:muuankarski/luntti.git
	fetch = +refs/heads/*:refs/remotes/origin/*
	push = +refs/heads/master:refs/heads/gh-pages 
	push = +refs/heads/master:refs/heads/master 
[branch "master"]
	remote = origin
	merge = refs/heads/master
```

Vedä tietty branch ([lähde](http://stackoverflow.com/questions/1709177/git-pull-certain-branch-from-github))


```r
git pull origin other-branch
```


Resettaa .gitignore ([lähde](http://stackoverflow.com/questions/1139762/ignore-files-that-have-already-been-committed-to-a-git-repository))


```r
git rm -r --cached .

git add .

git commit -m ".gitignore toimii taas"
```

