---
layout: post
title:  "Mapping Finnish orienteers using R"
date:   2012-10-07 11:00:45
categories: R-project
---

## Introduction

The code below can be used to map Finnish orienteers based on the home town of the club they are membering. Some documentation is provided within the code, but most of it is rather self-explanatory.

As a conclusion one can say that the elite runners in mens class are highly concentrated into the top clubs. There are some alternatives clubs with few elite runners, eg. Vetelin Urheilijat. As a spatial representation this is misleading in a way that many of the runners in country teams do actually live in larger centers. Which is also the case with famous Vetelin Urheilijat

In addition, top 100 in working age classes are the most regionally concentrated. A more detailed analysis can be done by tweaking the code, but this requires slightly more memory than what is currently available.

## The Analysis


```r
library(XML)
library(plyr)
library(reshape2)
library(ggplot2)
library(stringr)
library(gpclib)
library(RColorBrewer)
library(mapproj)
library(maptools)
library(rgdal)
library(RJSONIO)
library(car)
```



```r
####################################
####################################
# rankidata ssl:n Irmasta

temp <- tempfile()
####################################
# Men
#h16
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=2800&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h16 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h16$class[df.h16$Place < 2000] <- 'h16'
```

```
## Error: object 'df.h16' not found
```

```r
#h18
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=2600&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h18 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h18$class[df.h18$Place < 2000] <- 'h18'
```

```
## Error: object 'df.h18' not found
```

```r
#h20
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=2500&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h20 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h20$class[df.h20$Place < 2000] <- 'h20'
```

```
## Error: object 'df.h20' not found
```

```r
#h21
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=1100&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h21 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h21$class[df.h21$Place < 2000] <- 'h21'
```

```
## Error: object 'df.h21' not found
```

```r
#h35
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=1200&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h35 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h35$class[df.h35$Place < 2000] <- 'h35'
```

```
## Error: object 'df.h35' not found
```

```r
#h40
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=1300&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h40 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h40$class[df.h40$Place < 2000] <- 'h40'
```

```
## Error: object 'df.h40' not found
```

```r
#h45
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=1400&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h45 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h45$class[df.h45$Place < 2000] <- 'h45'
```

```
## Error: object 'df.h45' not found
```

```r
#h50
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=1500&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h50 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h50$class[df.h50$Place < 2000] <- 'h50'
```

```
## Error: object 'df.h50' not found
```

```r
#h55
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=1600&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h55 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h55$class[df.h55$Place < 2000] <- 'h55'
```

```
## Error: object 'df.h55' not found
```

```r
#h60
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=1700&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h60 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h60$class[df.h60$Place < 2000] <- 'h60'
```

```
## Error: object 'df.h60' not found
```

```r
#h65
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=1800&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h65 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h65$class[df.h65$Place < 2000] <- 'h65'
```

```
## Error: object 'df.h65' not found
```

```r
#h70
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=1900&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h70 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h70$class[df.h70$Place < 2000] <- 'h70'
```

```
## Error: object 'df.h70' not found
```

```r
#h75
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=2000&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.h75 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.h75$class[df.h75$Place < 2000] <- 'h75'
```

```
## Error: object 'df.h75' not found
```

```r
df.h <- rbind(df.h16,df.h18,
              df.h20,df.h21,
              df.h35,df.h40,
              df.h45,df.h50,
              df.h55,df.h60,
              df.h65,df.h70,df.h75)
```

```
## Error: object 'df.h16' not found
```

```r
df.h$sex[df.h$Place < 2000] <- 'herr'
```

```
## Error: object 'df.h' not found
```

```r
####################################
####################################
# Women
#d16
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=6800&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d16 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d16$class[df.d16$Place < 2000] <- 'd16'
```

```
## Error: object 'df.d16' not found
```

```r
#d18
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=6600&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d18 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d18$class[df.d18$Place < 2000] <- 'd18'
```

```
## Error: object 'df.d18' not found
```

```r
#d20
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=6500&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d20 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d20$class[df.d20$Place < 2000] <- 'd20'
```

```
## Error: object 'df.d20' not found
```

```r
#d21
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=5100&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d21 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d21$class[df.d21$Place < 2000] <- 'd21'
```

```
## Error: object 'df.d21' not found
```

```r
#d35
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=5200&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d35 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d35$class[df.d35$Place < 2000] <- 'd35'
```

```
## Error: object 'df.d35' not found
```

```r
#d40
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=5300&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d40 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d40$class[df.d40$Place < 2000] <- 'd40'
```

```
## Error: object 'df.d40' not found
```

```r
#d45
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=5400&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d45 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d45$class[df.d45$Place < 2000] <- 'd45'
```

```
## Error: object 'df.d45' not found
```

```r
#d50
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=5500&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d50 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d50$class[df.d50$Place < 2000] <- 'd50'
```

```
## Error: object 'df.d50' not found
```

```r
#d55
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=5600&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d55 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d55$class[df.d55$Place < 2000] <- 'd55'
```

```
## Error: object 'df.d55' not found
```

```r
#d60
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=5700&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d60 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d60$class[df.d60$Place < 2000] <- 'd60'
```

```
## Error: object 'df.d60' not found
```

```r
#d65
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=5800&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d65 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d65$class[df.d65$Place < 2000] <- 'd65'
```

```
## Error: object 'df.d65' not found
```

```r
#d70
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=5900&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d70 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d70$class[df.d70$Place < 2000] <- 'd70'
```

```
## Error: object 'df.d70' not found
```

```r
#d75
download.file("https://irma.suunnistusliitto.fi/irma/haku/ranki?id=6000&laji=SUUNNISTUS",
              destfile=temp, method="curl")
df.d75 <- read.csv(temp, sep=";", skip=1)
```

```
## Error: cannot open the connection
```

```r
df.d75$class[df.d75$Place < 2000] <- 'd75'
```

```
## Error: object 'df.d75' not found
```

```r
df.d <- rbind(df.d16,df.d18,
              df.d20,df.d21,
              df.d35,df.d40,
              df.d45,df.d50,
              df.d55,df.d60,
              df.d65,df.d70,df.d75)
```

```
## Error: object 'df.d16' not found
```

```r
df.d$sex[df.d$Place < 2000] <- 'damen'
```

```
## Error: object 'df.d' not found
```

```r
df <- rbind(df.d,df.h)
```

```
## Error: object 'df.d' not found
```

```r
####################################
####################################
# Next, we need a data file where clubnames are linked with town and their coordinates
# You can make the data, 
# 1. by taking the list of clubs from here:
# https://irma.suunnistusliitto.fi/irma/public/club/list
# And,
# A good tutorial for making the geocoding can be found in here
# http://allthingsr.blogspot.fi/2012/01/geocode-your-data-using-r-json-and.html
####################################
# Here I'm provind a link to a file 
# Load a data, which structures as
# Town,Club,lat,long
####################################

df.loc <- read.csv("http://markuskainu.fi/data/blog/df.seura.loc.en.csv")

df.x <- join(df,df.loc,by="Club")
```

```
## Error: object of type 'closure' is not subsettable
```

```r
####################################
####################################
# Suomen shapefile GADM-tietokannasta
####################################
library(sp)
con <- url("http://gadm.org/data/rda/FIN_adm0.RData")
print(load(con))
```

```
## [1] "gadm"
```

```r
close(con)

# shapefile into data.frame
gpclibPermit() 
```

```
## [1] TRUE
```

```r
gadm@data$id <- rownames(gadm@data)
gadm.points <- fortify(gadm, region="id")
gadm.df <- merge(gadm.points, gadm@data, by="id")
```

## Top 100 runners in H21-class


```r
###########################################
###########################################
# Kaikki yhdellä kartalla 
df.x.h21 <- subset(df.x, class == 'h21')
```

```
## Error: object 'df.x' not found
```

```r
df.x.h21 <- subset(df.x.h21, Place < 101)
```

```
## Error: object 'df.x.h21' not found
```

```r
cnames <- df.x.h21[-which(duplicated(df.x.h21$Club)), ]
```

```
## Error: object 'df.x.h21' not found
```

```r
ggplot(gadm.df, aes(long,lat,group=group)) +
  geom_polygon(fill="Azure 1", color = "Dark Gray") + geom_point(data=df.x.h21, aes(long,lat, group=Club, color=Place), size=3, #shape=1,
             position=position_jitter(width=.1,height=.1)) +
  coord_map(project="orthographic") + 
  geom_text(data=cnames, aes(long, lat, label = Club, group=Club), 
            size=3, color="black", hjust=0.5, vjust=-2.0)
```

```
## Error: object 'df.x.h21' not found
```

## Top 100 runners in all classes (16-75, men and women)


```r
###########################################
###########################################
# Kaikki yhdellä kartalla 
cnames <- df.x[-which(duplicated(df.x$Club)), ]
```

```
## Error: object 'df.x' not found
```

```r
ggplot(gadm.df, aes(long,lat,group=group)) +
  geom_polygon(fill="Azure 1", color = "Dark Gray") + 
  coord_map(project="orthographic") +
  geom_point(data=df.x, aes(long,lat, group=Club, color=Place), size=2, shape=1,
             position=position_jitter(width=.1,height=.1)) +
  geom_text(data=cnames, aes(long, lat, label = Town, group=Town), 
            size=3, color="black", hjust=0.5, vjust=-2.0,
            family="Russo One")
```

```
## Error: object 'df.x' not found
```

## Top 100 in each class by sex


```r
# Kunkin sarjan 100 parasta sukupuolittain
df.x.100 <- subset(df.x, Place < 100)
```

```
## Error: object 'df.x' not found
```

```r
ggplot(gadm.df, aes(long,lat,group=group)) +
  geom_polygon(fill="Azure 1", color = "Dark Gray") + 
  coord_map(project="orthographic") +
  geom_point(data=df.x.100, aes(long,lat, group=Club, color=Place), size=2, #shape=1,
             position=position_jitter(width=.1,height=.1)) +
  facet_wrap(~sex)
```

```
## Error: object 'df.x.100' not found
```

## Top 100 in each classes faceted by sex and grouped class


```r
# Koukkupolvet vs. aikuiset vs. nuoret
df.x.100 <- subset(df.x, Place < 100)
```

```
## Error: object 'df.x' not found
```

```r
df.x.100$cat[df.x.100$class == 'd16'] <- '1. junior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd18'] <- '1. junior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd20'] <- '1. junior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h16'] <- '1. junior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h18'] <- '1. junior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h20'] <- '1. junior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h21'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h35'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h40'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h45'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h50'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h55'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd21'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd35'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd40'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd45'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd50'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd55'] <- '2. work-age'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h60'] <- '3. senior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h65'] <- '3. senior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h70'] <- '3. senior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'h75'] <- '3. senior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd60'] <- '3. senior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd65'] <- '3. senior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd70'] <- '3. senior'
```

```
## Error: object 'df.x.100' not found
```

```r
df.x.100$cat[df.x.100$class == 'd75'] <- '3. senior'
```

```
## Error: object 'df.x.100' not found
```

```r
ggplot(gadm.df, aes(long,lat,group=group)) +
  geom_polygon(fill="Azure 1", color = "Dark Gray") + 
  coord_map(project="orthographic") +
  geom_point(data=df.x.100, aes(long,lat, group=Club, color=Place), size=2, #shape=1,
             position=position_jitter(width=.1,height=.1)) +
  coord_map(project="azequidistant") + facet_grid(cat~sex)
```

```
## Error: object 'df.x.100' not found
```

## Conclusions

As concluding remarks one can say that this approach could proven rather fruitful when discussing the regional equality issues in organising major events. Further North you go the more expensive it becomes for the masses to show up. This can result non-participation  due to lack of financial or motivational resources.


[jekyll-gh]: https://github.com/mojombo/jekyll
[jekyll]:    http://jekyllrb.com
