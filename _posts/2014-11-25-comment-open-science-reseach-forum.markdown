---
layout: post
title:  "My comment on the Open Science and Research Roadmap 2014-2017 at the Open Science and Research Forum"
date:   2014-11-25 08:23:45
categories: avoin tiede
---

I restructured the text a bit on Tuesday afternoon. See the changes at [github](https://github.com/muuankarski/muuankarski.github.io/commit/1c0683068319a40c81a5267cc91b2c895d41f58a?short_path=9acc33c#diff-9acc33cb73626d35bde656417b294a5d)

- [event website](http://web.csc.fi/csc/kurssit/arkisto/openscienceforum)
- [twitter search with hashtag #ATTforum](https://twitter.com/search?q=%23ATTforum&src=typd)

---

*[Open Science and Research Roadmap](http://www.minedu.fi/OPM/Julkaisut/2014/Avoimen_tieteen_ja_tutkimuksen_tiekartta_2014_2017.html) is an ambitious plan for making Finland a leading country for openness in science and research by 2017. I commented the roadmap from researcher point of view and focused in research methods. In my view, we should first focus on spreading the current good practises of open research methods among researchers. We should remove all restrictions limiting researchers freedom to learn and apply new software for their research, and invest in discipline specific IT-support. Once the critical mass is achieved, things will start to happen. Also, I believe, that wider adoption of open reseach methods among researchers will improve their labour market potential and give them greatly better capabilities for solving societal problems. Research does not solely solve problems, but when paired with software is one step closer.*

---

First, few words about myself and my work. My name is Markus Kainu. I'm a PhD Candidate in Social Policy and I do research at the [Aleksanteri Institute](http://www.helsinki.fi/aleksanteri/english/), which is the Center for Russian and Eastern European studies in university of Helsinki.

I study poverty, inequality and welfare state development in the ex-Soviet bloc, namely Russia and Eastern Europe. Our research groups latest article was called [Paradoxes of Agency: Democracy and Welfare in Russia](http://www.metapress.com/content/p7517v2929mw5871/) that was published in *Demokratizatsiya: The Journal of Post-Soviet Democratization*. (that is behind a paywall..)

In addition to substantive research, I write software for accessing and analysing the dataset such as [Eurostat-database](https://github.com/rOpenGov/eurostat), [EU-silc -survey data](https://github.com/muuankarski/r.eusilc) or [Quality of Government data](https://github.com/rOpenGov/rqog), within [rOpenGov](http://ropengov.github.io/) project. I primarily use [R-language](http://www.r-project.org/) for statistical computing.

In addition to my academic affiliations, I do represent here also the [*open science working group*](http://fi.okfn.org/wg/openscience/) of [Open Knowledge Finland](http://fi.okfn.org/), where we try to keep up with discussions abroad, collaborate in research software and try to find out the costs of academic publishing within Finnish universies, for instance. ([Join the Facebook group here](https://www.facebook.com/groups/241398182642057/))

---

In general I must say that this document captures rather well all the nuances and variable focus within the young and evolving *open science discourse*. General objective is ambitious, but it is clearly stated and split into more concrete sub-objectives, and therefore it is easy to give comments on that.

But, as the time is limited, I decided to asses the roadmap from my researchers experience and to comment it in order to make it more appealing for a fellow researchers and therefore, hopefully, to contribute to the viability of the roadmap.

---

## Open Science in my field

My field is a late adopter when it comes to each three aspects of this roadmap. Many speakers have emphasized the differences between fields of sciences and disciplines, and I also want to underline that. 
	
As for *publications*, hard cover books are still *the hard currency*, and open access publishing is often mixed with predatory publishing and so forth.

As for *research data*, it is still unclear for many fields in social sciences and humanities [what actually consist of research data](http://blogs.lse.ac.uk/impactofsocialsciences/2014/10/29/open-science-disciplinary-culture-clash/). On the other hand, a lot of research uses *open government data* which is the primary fuel for the wider *open data* movement. So one could say, that in some cases researchers dont know whether they have any data, and in some case the data is open according to [*open definition*](http://opendefinition.org/). Most cases are somewhere in between.

The data I use is primarily collected by someone else, for instance statistical agencies as Eurostat or Rosstat, or research projects such as European Social Survey. In most cases it is survey data that has information about individuals and households, and therefore access to the data is often restricted. At the same time, I do use country and region level indicators of economic and social development that come close to *open data*. 

Using data collected by others is very typical for my kind of analysis, where you have big datasets with hundreds of thousands individuals covering many countries across several years with *thousands of users*. This type of analysis would, in my opinion, greatly benefit from *open research methods*: from crafting and sharing code and software, but there is virtually none of it. As many of you know the SPSS-software stands for *Statistical Package for the Social Sciences*, but unfortunately, very little has changed since the introduction of the software in late 60's, in terms of openness of the software or research methods, at least.

## My path into Open research Methods

From my grassroot point of view I feel that openness of the research methods could have the greatest impact on the daily practises researchers, and for same reason, may be the toughest to implement. We don't publish research papers or data that often, that changing it would be a great change. 

My interest in open source research software started once I realized how much time and effort I had to inverst in mastering the analysis. I simply thought I don't want to be dependent on institutions paying my licence costs nor restricted by software lisences for what kind analysis I'm allowed to do. And, I didn't feel software piracy sustainable.

However, it was not an smooth path in my field. It meant that had to learn to support my software, maintain my systems and manage the data, by myself. I was lucky though, as during the same period, the open source community in scientific software really took off, and there were better and better learning resources. However, taking this path substantially delayd my graduation.

So as an end result of this experience, I feel **that a skilled and informed researcher, in my field and with digital services already available in the web, does not need much of a national infrastructure to make his research efficient, open and sustainable.** Therefore, as a general remark, *I am slighly worried about by central role of research organisation, services and infrastructure in the roadmap, and absence of researcher views.* Our, researchers, participation should be more active.

## Means

### Liberate and empower the researcher

The value of Open Source research software does not come from the savings in licence costs, but from the potential of research community together develope tools for analysis of very spesific research problems.

Gary King, the professor of political science and Director of the Institute for Quantitative Social Science in Harvard University stated on the role of university IT:

>Leaving computer technology to the university IT department does not work, no matter how qualified they are because they are first to satisfy the 95% with vanilla services, whereas cutting-edge methods researchers are usually in the remaining 5%. [(King, Gary. “Restructuring the Social Sciences: Reflections from Harvard’s Institute for Quantitative Social Science.” PS: Political Science and Politics 47.1 (2014): p. 171](http://gking.harvard.edu/ations/restructuringuu-social-science)

So what follows from my experience, and from what I have learned for colleagues abroad, is that researchers have to have full control over their computers and software. **Researchers have to be able to learn and apply new software the same way they can learn and apply new theories from books in library. There cannot be anyone deciding on the behalf of the research, what books and software he or she is allowed use, IF we want our research be world leading.** This is a challenge for university IT as, to my experience, they have moved to opposite direction in recent years. We must remember that one-size-(may-)fit all the bureaucrats, but not cutting egde research.

### We need network effect

What must be kept in mind here is that digital technologies, when well planned, scale well. What we could behefit from unchaining the software environment that the great majority of researcher use, is the so called [network effect](http://en.wikipedia.org/wiki/Network_effect). 

>In economics and business, a network effect (also called network externality or demand-side economies of scale) is the effect that one user of a good or service has on the value of that product to other people. When a network effect is present, the value of a product or service is dependent on the number of others using it [wikipedia](http://en.wikipedia.org/wiki/Network_effect).

Again using myself as an example, the quality and amount of my research would be greatly improved if my research group could fully utilize the potential of open source research software, my expertise and software. If I'm just learning new things and the gap between myself and colleagues is widening, it does not make much difference. At the national level, this is true as well. We could improve our performance a lot if the majority of researcher would adopt skills in sustainable information management, choosing sustainable software for their research and so forth. 

As science fiction novellist William Gibson once stated: "*The future is already here. It’s just not evenly distributed yet*". in this vein, I think that ATT should focus on *redistribution of this future*, the good and top practises in research, to the masses, rather than building new infrastructures.

## How to motivate resarchers

Until here I have been an optimist, but from here on it gets more problematic.

What I'm curious about are the **mechanism that are believed to bring all these changes into daily practises of researcher. How can you make such fundamental changes into extremely busy and uncertain life of a academic reseacher?**

I often ask from fellow researchers when I run workshop or tutorials in the issues, *how many analytical applications  and how many bureaucratic applications have you adopted in the past five years*? Usually the results is that bureaucratic applications overcome the analytical. Similarly, workshops on how to write a successfull ERC application are popular, but workshops on version control or reproducible analysis are less so.

So, it is not that researchers don't care about learning new analytical skills, but that the bureaucratic burden and writing funding applications together with doing the research leaves no resources for that. 

So before crafting policies for one should have a realistic picture of what are the information management practises, understanding, capabilities and resources of researchers to learn and apply these new techniques, how they differ between disciplines. We are asking our political decision making to be *evidence based*, and so should be this iniative.

## Carrots, more carrots



Personally I agree with [Sustainable research software manifesto](http://www.software.ac.uk/policy/manifesto) that I'm quoting here:

>We believe that the full benefits of software in research will only be realised when software is accepted as a valid research output.

>We call for all researchers to have access to basic software training to help them harness the power of software for their research.

>We say that there must be reward and recognition for Research Software Engineers: the people who contribute to research by developing software.

>Finally, we argue that good software practices create better software, and that better software improves the reproducibility and reusability of research.

In more details, **we need clear commitment from university directors, adjustments in academic and financial incentives to make open pratices attreactive ja substantial reformulation of doctoral training**. At the same time it is important to bear in mind that cultural changes do not occur from above.

--- 

Currently, in my experience, there is a increasing outflow of good researchers from university. In many cases there are more *push factors*, than *pull factors*. Another timely topic is the academic unemployment, that applies more and more to researcher with doctoral degree. There have been comments on low labour market capabilities of researchers. Personally, I was delighted to read earlier this year from [2014 Dice Tech Salary Survey ](http://marketing.dice.com/pdf/Dice_TechSalarySurvey_2014.pdf) that *R*-language skills were returning the highest salaries in US tech sector in last year. Most probably value of these methods increases also here in Finland. Therefore, I wish that universities and reseach organisations, across disciplines, will do their best to lessen the *push factors* and promote these new open research methods to create more *pull factors* for graduating researchers.

Thank you for this opportunity! Keep up the great work!


---

### My other work related to ATT

- <http://portti.avointiede.fi/tutkimusmenetelmat/kuinka-menetelmien-avoimuus-sujuvoittaa-tutkimustyota>
- <https://www.youtube.com/watch?v=xMAPN3ljwWA>


[jekyll-gh]: https://github.com/mojombo/jekyll
[jekyll]:    http://jekyllrb.com
