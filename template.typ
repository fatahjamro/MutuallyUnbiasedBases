
#let thesis(
  title: none,
  author: none,
  degree: none,
  institution: none,
  logo: none,
  department: none,
  date: datetime.today(),
  abstract: none,
  acknowledgments: none,
  doc
) = { 
  
  set document(
    author: author,
    title: title,
    date: date,
  )

  set page(
    paper: "a4",
    margin: (x: 25mm, y: 20mm),
    number-align: right,
  )

  set text(
    font: "Georgia",
    size: 11pt,
  )

  set par(
    leading: 1em,
    spacing: 1.8em,
  )

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    text(
      24pt,
      fill: rgb("#005b5e"),
    )[#it.body]
    v(4mm)
  }
  
  // Title page
  align(center)[
    #text(24pt, weight: "bold", fill: rgb("#005b5e"))[#title]
    #v(10mm)
    #text(18pt, weight: "bold", fill: rgb("#005b5e"))[#author]
    #v(20mm)
    #v(1mm)
    #text(16pt)[#degree]
    #v(1mm)
    // #text(12pt)[Thesis]
    #v(1mm)
    #text(12pt)[#department]
    #v(30mm)
    #text(14pt)[#date.display("[month repr:long] [year]")]
    #v(1mm)
    #if logo != none {
      place(
      bottom + center,
      scope: "parent",
      float: true,
      image(logo, width: 80mm)
      )
    }
  ]

  set page(numbering: "1")
  counter(page).update(2)

  // if abstract != none {
  //   [= Abstract]
  //   abstract
  // }

  // // Acknowledgments
  // if acknowledgments != none {
  //   [= Acknowledgments]
  //   acknowledgments
  // }

  // Table of Contents
  pagebreak(weak: true)
  set outline.entry(fill: line(length: 100%, stroke: 0.1pt),)
    show outline.entry: set block(above: 1em)
  show outline.entry.where(
    level: 1
  ): set block(above: 1.2em)
  outline(depth: 2, title: [Table of Contents #v(10mm)])

  set heading(
    numbering: "1.1",
  )

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    // text(
      // 16pt,
      // fill: rgb("#005b5e"),
    // )[Chapter #counter(heading).display("1")]
    // v(-8mm) 
    set par(leading: 0.6em)
    text(
      24pt,
      fill: rgb("#005b5e"),
    )[#it.body]
    v(4mm)
  }

  show bibliography: it => {
    show heading.where(level: 1): it => {
      pagebreak(weak: true)
      text(
        24pt,
        fill: rgb("#005b5e"),
      )[#it.body]
    }
    it
  }

  doc
}
