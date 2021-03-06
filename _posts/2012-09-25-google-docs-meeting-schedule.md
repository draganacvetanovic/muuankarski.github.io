---
layout: post
title:  "Google Docs, R and ggplot2 for fixing meeting scedules"
date:   2012-09-25 11:00:45
categories: R-project
---


First you have to [create a form](http://support.google.com/docs/bin/answer.py?hl=en&amp;answer=87809). The code I'm using here is embedded below. I use one **text** type of question for name and two sets of questions for suitable dates for two different weeks, namely weeks 40 and 41 in 2012. Question type for these is **grid.** I allow three options **Yes!**, **No!** and **Maybe**.

I have made three entries for this demo through that form below and use that data below.

<p><iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dHAtUmdPcGVNMDlkUzh4SFhWMDBqT3c6MQ" frameborder="0" marginwidth="0" marginheight="0" width="630" height="800">Ladataan...</iframe></p>

Then I looked [this blog post by Revolution Analytics](http://blog.revolutionanalytics.com/2009/09/how-to-use-a-google-spreadsheet-as-data-in-r.html) and had a look how to make your google docs spreadsheet data available as .csv -file.

Then I wrote a small piece of R-code and came up with a plot below. The code is embedded.


```r
#Download and clean the data
 
# load the packages
library(RCurl)
```

```
## Loading required package: methods
## Loading required package: bitops
```

```r
library(ggplot2)
library(reshape2)
library(car)
library(plyr)
library(stringr)
# copy the url of the csv-file from google docs
myCsv <- getURL("https://docs.google.com/spreadsheet/pub?key=0AqQZEZLGjzKAdHAtUmdPcGVNMDlkUzh4SFhWMDBqT3c&single=true&gid=0&output=csv")
# read as data frame
df <- read.csv(textConnection(myCsv), na.strings = "")
# choose all but the first colunm (time stamp)
df2 <- df[c(2:12)]
 
# melt it into long format for ggplot2
df.l <- melt(data=df2,
id.vars="Name")
```

```
## Warning: attributes are not identical across measure variables; they will
## be dropped
```

```r
# remove missing values
df.l <- df.l[!is.na(df.l$value),]
# replace queues of dots from variable names
df.l$variable <- str_replace_all(df.l$variable,
pattern="[..]", replacement="_")
# we remove the string "what suits you"
df.l$variable <- str_replace_all(df.l$variable,
pattern="What_day_suits_you____", replacement="")
 
#And then for plotting
 
ggplot(df.l, aes(x=Name,y=variable)) +
geom_dotplot(aes(fill=value), binaxis="y",
stackdir="center", binwidth=0.8) +
theme(axis.text.x=element_text(angle=90)) +
theme(legend.position="top") +
guides(fill = guide_legend(keywidth=3)) +
scale_fill_manual(values=c("yellow","red","green"))
```

![plot of chunk unnamed-chunk-1](/figure/source/2012-09-25-google-docs-meeting-schedule/unnamed-chunk-1.png) 

And here is the plot. You can vote in that for yourself and try to reproduce the plot using the exact same code. You answer should be incorporated.

[jekyll-gh]: https://github.com/mojombo/jekyll
[jekyll]:    http://jekyllrb.com
