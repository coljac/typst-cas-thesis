#import "template.typ": *
#show: thesis.with(title: "My Thesis",
author: "Colin Von Special")[
// Front matter: Abstract, acknowledgements, declaration

// #abstract[
= Abstract

#lorem(100)
// ]

= Acknowledgements

#lorem(200)

= Declaration

The work presented in this thesis has been carried out in the Centre for Astrophysics & Supercomputing at Swinburne University of Technology between 20?? and 20??. This thesis contains no material that has been accepted for the award of any other degree or diploma. To the best of my knowledge, this thesis contains no material previously published or written by another author, except where due reference is made in the text of the thesis. The content of the chapters listed below has appeared in refereed journals. Minor alterations have been made to the published papers in order to maintain argument continuity and consistency of spelling and style.

• Chapter 2 has been published as ...\
• Chapter 3 has been published as ...

My contribution to these papers was ..., accounting for X percent of the final manuscripts.

My co-authors contributed by ..., accounting for Y percent of the final manuscripts.

  #align(right)[
    Your Name
  
    Melbourne, Victoria, Australia
  
    year
  ]
]

// =============================
// The rest of the thesis below
// =============================


= Introduction

== Galaxies
#set cite(brackets: true)

In @ferreiraPanicDisksFirst2022; @whitneyGalaxyEvolutionAll2021 we learned about galaxies. Also, there are big and small stars #cite("whitneyGalaxyEvolutionAll2021", "hoekstraMassesGalaxyClusters2013", brackets: true).
#lorem(22) 

Cite #cite("whitneyGalaxyEvolutionAll2021", "hoekstraMassesGalaxyClusters2013")

Citep #citep("whitneyGalaxyEvolutionAll2021", "hoekstraMassesGalaxyClusters2013")

citet #citet("whitneyGalaxyEvolutionAll2021", "hoekstraMassesGalaxyClusters2013")

At notation @whitneyGalaxyEvolutionAll2021

#lorem(400)

#figure(caption: [
  This is a picture of some galaxies. They have many stars. *Top:* Some galaxies. *Bottom:* More galaxies. 
  // #lorem(20)  \
], 
  placement: auto,
  image("figures/sdss.png", width: 100%)
)

== Clusters

#lorem(244)

$ alpha = 2 beta^2 $

== Radio astronomy

#lorem(222)

= Methodology

== The data

#lorem(300)

#figure(caption: [
  This is a plot of some data. *Left:* Data, in blue. *Right:* Data, in green. 
], 
  placement: none,
  image("figures/gini2.svg", width: 100%)
)

== The pipeline

#lorem(100)

#figure(caption: "The types of data we used.",
placement: none,
table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [*Description*], [*Area*], [*Parameters*],
  [Cylinder],
  $ pi h (D^2 - d^2) / 4 $,
  [
    $h$: height \
    $D$: outer radius \
    $d$: inner radius
  ],
  [Tetraheron],
  $ sqrt(2) / 12 a^3 $,
  [$a$: edge length]
)
)<atable>
See the table of date in @atable. #lorem(100)

#lorem(100)

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $<eqsum>

In @eqsum, we show the math.

= Foo

#lorem(33)

== Sub1

#counter(heading.where(level: 1)).display()
    $ alpha 2 = 4 $

#state("stt").update("XX")
// #aa.update("XX")

aa #locate(loc => [
  #loc.page()
  // #if loc.page() == 17 [
  //   #aa.update(loc.page())
  //   AA!
  // ]

  
]) bb 
!

#state("stt").display() !!!!!!!

= Doing stuff

#lorem(1000)

= Getting data

#lorem(1000)

= Conclusion

== Before I did things
#lorem(400)
== After I did things
#lorem(400)
== The end
#lorem(400)