#import "@preview/outrageous:0.4.0"
#import "@preview/hydra:0.6.2": hydra
#import "@preview/colorful-boxes:1.4.1": colorbox
#import "@preview/datify:0.1.4": custom-date-format
// The main color of the Paris-Saclay University visual identity
#let prune = rgb(99, 0, 60)

// Yellow background color for highlighting
#let yellow-highlighting = rgb("#fffd11a1") // default color of highlight() https://typst.app/docs/reference/text/highlight/#parameters-fill

// An highlighted empty rectangle for missing parameters
#let missing-field(width: 10em) = box(
  fill: yellow-highlighting,
  width: width,
  height: 1em,
  baseline: 0.2em,
)

// A box to have a small summary for a section/sub-section
#let summary(body) = {
  colorbox(
    title: text(font: "Open Sans")[En résumé],
    radius: 2pt,
    width: auto,
    box-colors: (
      prune: (stroke: prune, fill: white, title: white),
    ),
    color: "prune",
  )[
    #body
    #v(2pt)
  ]
}

// Allows to have non numbered sections, eg.
//= Addendum <unnumbered>

#show selector(<unnumbered>): set heading(numbering: none)

// List of tables
#let table-list() = {
  heading("Liste des tables", numbering: none)
  outline(target: figure.where(kind: table), title: none)
}

// List of figures
#let figure-list() = {
  heading("Liste des figures", numbering: none)
  outline(target: figure.where(kind: image), title: none)
}

// Lexicon
#let lexicon(content) = {
  heading("Lexique", numbering: none)
  (content)
}

// A "Remarque : " text box

#let remark(number: none, body) = {
  block(stroke: (left: 1pt), inset: 0.5em)[
    #smallcaps[Remarque #number :] #body
  ]
}

// The function takes the whole document as `body` parameter
// and formats it for a IUT Orsay report
#let iut-orsay-report(
  // The first and last names of the candidate
  student-name: highlight[Prénom Nom],
  group: highlight[Groupe],
  // The thesis title in French
  title: highlight[Titre de la thèse],
  // The translated thesis title in English
  subtitle: highlight[Title of the thesis],
  // The keywords of the thesis subject, in French
  keywords: (highlight[Mot-clé 1], highlight[Mot-clé 2], highlight[Mot-clé 3]),
  // The line for the doctoral school number and name
  diploma: [Département #missing-field()],
  // The line for the specialty
  specialty: [],
  // The line for the graduate school
  level: [#missing-field() année],
  // The date of the PhD defense
  report-date: custom-date-format(datetime.today(), "DD MMMM YYYY", "fr"),
  // Report type
  report-type: [],
  // Training/Alternance
  company-name: [],
  company-logo: "img/empty.png",
  // Spacings in the first page
  vertical-spacing-1: 15pt,
  vertical-spacing-2: 55pt,
  vertical-spacing-3: 40pt,
  vertical-spacing-4: 40pt,
  vertical-spacing-5: 40pt,
  horizontal-spacing-1: 50pt,
  horizontal-spacing-2: 100pt,
  // The thesis content
  body,
) = {
  set page(
    paper: "a4",
    margin: (
      left: 0pt,
      top: 0pt,
      bottom: 0pt,
      right: 2.5cm,
    ),
  )

  set text(
    font: "Open Sans",
    size: 12pt,
    lang: "fr"
  )

  let rectangle_width = 16.4% * 21cm // 16.4% of the page width

  grid(
    columns: (rectangle_width, 100% - rectangle_width),
    gutter: 25pt,
    [
      #rect(
        fill: prune,
        width: 100%, // 100% of rectangle_width,
        height: 100%,
      )
    ],
    [ // right part of the grid

      #v(vertical-spacing-1)

      #image("img/iut-orsay.svg", width: 50% * 21cm)

      #v(vertical-spacing-2)

      #align(right)[
        #text(
          size: 20pt,
          fill: prune,
        )[
          #title
        ]\
        #v(2pt)
        #text(
          size: 13pt,
          fill: black,
          style: "italic",
        )[
          #subtitle
        ]\

        #v(vertical-spacing-3)

        #text(
          size: 13pt,
          weight: 400,
        )[
          #if specialty != none [*#diploma --- #specialty*] else [*#diploma*]\
        ]
        #text(
          size: 12pt,
        )[
          #level
        ]

        #text(
          size: 11pt,
        )[
          *Rapport rédigé le #report-date, par* \
        ]

        #text(
          size: 20pt,
          fill: prune,
          weight: 600,
        )[
          #student-name -- #group
        ]
      ]

      #v(vertical-spacing-4)

      #align(center)[
        #text(
          size: 12pt,
        )[
          #if report-type == [stage] [
            Stage effectué au sein de :
          ] else if report-type == [apprentissage] [
            Apprentissage effectué au sein de :
          ]
        ]

        #text(
          size: 12pt,
        )[
          #company-name
        ]

        #image(company-logo, width: 100%, height: 25%, fit: "contain")

      ]


      #v(vertical-spacing-4)

      #v(1fr)

      #grid(
        columns: (horizontal-spacing-1, auto),
        row-gutter: 1em,
        stroke: (x, y) => if x == 1 and y == 1 { (left: (1pt + prune)) },
        [],
      )

      #v(vertical-spacing-5)
    ],
  ) // end grid

  // from the second page, default margins of the A4 paper size
  set page(
    margin: auto,
  )
  set page(
    numbering: "1",
    header: context (hydra(1) + h(1fr) + student-name + [--] + group),
    footer: context [
      #set align(center)
      #set text(8pt)
      #counter(page).display(
        "1",
        both: false,
      )],
  )

  
  show heading: it => text(fill: prune)[
    #align(center)[
      #it #v(0.5em)
    ]
  ]
  show heading.where(level: 1): set text(15pt)
  show heading.where(level: 2): set text(12pt)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    it
  }

  pagebreak(weak: true)

  show outline.entry: outrageous.show-entry.with(
    font-weight: ("bold", auto),
    fill: (none, line(length: 100%, stroke: gray + .5pt)),
    prefix-transform: (lvl, prefix) => { [#h(0.001cm) #prefix] },
  )

  outline(
    depth: 2,
  )

  set par(
    justify: true
  )

  pagebreak()

  body
}
