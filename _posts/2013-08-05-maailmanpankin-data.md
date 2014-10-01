---
layout: post
title:  "Maailmanpankin data WDI-paketilla"
date:   2013-08-05 11:00:45
categories: R-project
---

# Tässä esimerkki




```r
library(WDI)
```

```
## Error: there is no package called 'WDI'
```

```r
dat <- WDI(indicator = c("NY.GDP.PCAP.KD"), country = c("CN", "RU", "IN", "BR"), 
           start = 1980, end = 2012)
```

```
## Error: could not find function "WDI"
```

```r
library(ggplot2)
```

```
## Loading required package: methods
```

```r
ggplot(dat, aes(year, NY.GDP.PCAP.KD, color = country)) + geom_line() + geom_point() + 
  labs(x = "year", y = "GDP per capita")
```

```
## Error: object 'dat' not found
```




[jekyll-gh]: https://github.com/mojombo/jekyll
[jekyll]:    http://jekyllrb.com
