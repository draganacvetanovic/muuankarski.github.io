# aja tutoriaalit (toistaiseksi vielä)
library(knitr)
knit("rqog.Rmd")
knit("rqog.Rmd")

# aja .Rmd blogipostit Rstudiossa
library(servr)
servr::jekyll()

# Uppaa palvelimelle
jekyll serve --watch --baseurl ''
cd ~/web/markuskainu/_site
rm -r cache
lftp -u np16003 -e "mirror -R;quit" ftp://np16003@www.muuankarski.org/domains/markuskainu.fi/public_html/

# Uppaa github:iin

cd ~/workspace/web/markuskainu/
rm -r cache
  
git add .
git commit -am "webbi paivitetty"
git push

