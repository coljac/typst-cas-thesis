/* 
  Swinburne PhD Thesis template
  See https://github.com/coljac/typst-cas-thesis for updates, documents and questions
*/

#let stt = state("stt", " ")
#let sttf = state("sttf", 0)

#let pb() = {
  stt.update(" ")
  pagebreak(to: "odd")
}

#let thesis(
  title: "My PhD Thesis",
  subtitle: "In the subject of Astronomy",
  author: "A. Student",
  year: 2023,
  for_binding: false,
  bibliography_file: "references.bib",
  frontmatter, content
) = {

  // Global stuff

  set page(paper: "a4",
    margin: (
    top: 2.5cm,
    bottom: 2cm,
    right: 3.5cm,
    left: 3.5cm,
    ),
    footer: locate(loc => {
      if sttf.at(loc) == 1 {
        align(center)[#counter(page).display("i")]
        sttf.update(0)
      } 
    }),
    
    


        
   //  locate(loc => {   
   //    if stt.at(loc) != 0 {
   //      [HEADER]
   //    }  
   // })
  )

  set par(
    leading: 1.5em,
    first-line-indent: 1em,
    justify: true
    )

    set text(size: 11pt)

    // Extra space around figures

    show figure: it => [#it #v(1em)]
    show outline.entry.where(
     level: 1
    ): it => {
      v(12pt, weak: true)
      strong(it)
   }

  set math.equation(numbering: (..nums) => "(" + counter(heading.where(level: 1)).display() + "." + nums
    .pos()
    .map(str)
    .join(".") + ")")
  
[


  // TITLE PAGE
    #set page(numbering: none)
    #place(dy: 20%, box(width: 100%, align(center, image("CAS_logo.svg", width: 70%))))
    #place(dy: 45%, box(width: 100%, stroke: 0pt, align(center, text(size: 33pt, title))))
    #place(dy: 55%, box(width: 100%, stroke: 0pt, align(center, text(size: 20pt, "By " + author))))
    #v(65%)
    #set text(size: 14pt)
    #align(center)[
    Presented in fulfillment of the requirements 
    
    of the degree of Doctor of Philosophy
    #v(2em)
    #text(size: 1.2em)[#year]
    #v(2em)

    School of Science, Computing and Engineering Technologies
    
    Swinburne University of Technology
  ]  
] // end title page

  // FRONT MATTER
  
  set page(numbering: "i")
  // counter(heading).update(1)
  
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    pb()
    if it.numbering == "1.1" { // This is regular a chapter heading
      v(20%)
      align(right, smallcaps[#text(font: "Liberation Sans", size: 76pt, fill: gray, weight: 300, counter(heading).display())])
    }// v(1.0em)
    // box(width: 100%, inset: 2pt, stroke: (bottom: 1pt+blue), 
    align(right)[
      #text(size: 30pt, weight: 400, it.body)
    ]
    v(1em)
    stt.update(it.body)
  }
  
  show heading.where(level: 2): it => {
      box(width: 100%, inset: (top: 1em, bottom: 1.0em), stroke: (bottom: 1pt+black))[ #text(size: 1.1em)[#it]]
  }
  [     
    #set heading(numbering: none)
    #frontmatter

    #counter(page).update(1)
    #counter(heading).update(0)
    #stt.update(" ")


    #set heading(numbering: "1.1")
    #set page(numbering: "1",     
    footer: locate(loc => {
      if sttf.at(loc) == 1 {
        align(center)[#counter(page).display("1")]
        sttf.update(0)
      } 
    }),
    header: locate(loc => {
      let l = [L]
      let r = [R]
      if calc.odd(loc.page()) { 
        l = [_ #counter(heading).display() #h(0.8em) #stt.display() _]
        r = counter(page).display("1")
      } else { 
        r = [_ #counter(heading).display() #h(0.8em) #stt.display() _]
        l = counter(page).display("1")
      }
      let leftbit = align(left)[#l]
      let rightbit = align(right)[#r]
      if stt.at(loc) != " " { 
        box(width: 100%, stroke: (bottom: 1pt+black), inset: (bottom: 2mm))[
          #grid(columns: (1fr, 1fr), [#leftbit], [#rightbit])
        ]} else {
          sttf.update(1)
        }
      })
      
  )

    
    #outline(title: "Contents", indent: 2em, depth: 2)
    
    #outline(
      title: [List of Figures],
      target: figure.where(kind: image),
    )
    
    #outline(
      title: [List of Tables],
      target: figure.where(kind: table),
    )

    #show figure.caption: it => [#it #v(0.3em)]
    #counter(page).update(0)
    #content

    #set heading(numbering: none)
    #bibliography(bibliography_file, style: "chicago-author-date")
    
  ] // End of body
}

// #let begin = [
//   #set text(size: 14pt) 
// ]


// =============================
// Helper functions - Citations
// =============================

#let citep(..citation) = {
  for c in "citation" {
    [#c #c]
  }
  cite(..citation, brackets: true)
}

#let citet(..citation) = {
  show regex(" \d{4}"): v => {
    show " ": vv => []
    [ (#v)]
  }
  cite(..citation, brackets:false)
}

// #let abstract(content) = [
//   #heading(outlined: true, level: 1, "Abstract")
// ]

// #outline(depth: 2)

// #outline(
//   title: [List of Figures],
//   target: figure.where(kind: image),
// )
// #pagebreak(to: "odd")

// #outline(
//   title: [List of Tables],
//   target: figure.where(kind: table),
// )
// #pagebreak(to: "odd")

// #content]

/* TODO:
- Cite with ; between
- e.g. in cite, etc. \cite[e.g.](colin2022)
- bibliography style
- captions set par(leading: 1.0em)
- Par indent is wonky, also headings
- Bibliography heading
* Figure caption spacing still dodgy
- subheadings indented as pars?
* page headings
* Odd, even page stuff
- Odd, even margins
* Page num at bottom on chapter pages
