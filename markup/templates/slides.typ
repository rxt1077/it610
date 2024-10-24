//#import "@preview/polylux:0.3.1": *
#import "/polylux/polylux.typ": *

// NJIT theme based on University theme
//
// Modified by Ryan Tolboom
// Originally contributed by Pol Dellaiera - https://github.com/drupol

#let njit-red  = rgb("#D22630")
#let njit-blue = rgb("#071D49")

// https://github.com/typst/typst/discussions/4260
#let resize-text(body) = layout(size => {
  let font_size = text.size
  let (height,) = measure(
    block(width: size.width, text(size: font_size)[#body]),
  )
  let max_height = size.height;
  
  while height > max_height {
      font_size -= 0.2pt
      height = measure(
        block(width: size.width, text(size: font_size)[#body]),
      ).height
  }
  
  block(
      height: height,
      width: 100%,
      text(size: font_size)[#body]
  )
})

// display and image with licensing info
#let licensed-image(
  file: none,
  license: none,
  title: none,
  url: none,
  author: none,
  author-url: none,
  width: 100%,
) = {
  let license-text = ""
  license = upper(license)
  if license == "FAIRUSE" {
    license-text = [#link(url)[#title] is used under fair use]
  } else if license == "PUBLIC" {
    license-text = [#link(url)[#title] is in the public domain]
  } else if license == "UXWING" {
    license-text = [#link(url)[#title] is licensed under #link("https://uxwing.com/license/")[the uxwing license]]
  } else if license == "CC0" {
    license-text = [#link(url)[#title] is in the public domain under #link("https://creativecommons.org/publicdomain/zero/1.0/")[CC0]]
  } else if license.starts-with("CC") {
    let license_parts = license.split()
    let options = license_parts.at(1)
    let version = license_parts.at(2)
    if version.contains(".") != true {
      version = version + ".0"
    }
    license-text = [#link(url)["#title"] by #link(author-url)[#author] is licensed under #link("https://creativecommons.org/licenses/" + lower(options) + "/" + version + "/")[CC #options #version]]
  } else {
    panic("Unknown license: " + license)
  }

  block(breakable: false, width: width)[
    #set align(center)
    #set text(size: 8pt)

    #block(below: 5pt)[#image(file)]
    #license-text
  ]
}

// ugly hack to convert callout number to a unicode character
#let num2unicode(num) = {
    set text(black, size: 18pt, weight: "bold")
    if      num == "<0>" [\u{24FF}]
    else if num == "<1>" [\u{2776}]
    else if num == "<2>" [\u{2777}]
    else if num == "<3>" [\u{2778}]
    else if num == "<4>" [\u{2779}]
    else if num == "<5>" [\u{2780}]
    else if num == "<6>" [\u{2781}]
    else if num == "<7>" [\u{2782}]
    else if num == "<8>" [\u{2783}]
    else if num == "<9>" [\u{2784}]
}

// code blocks in grey boxes with AsciiDoctor style callouts
#let code(body, title: none, callouts: none) = {
  set text(size: 15pt)
  show regex("<[0123456789]>"): it => {
    num2unicode(it.text)
  }
  if title != none {
    // why can't I center this?
    set text(njit-red)
    block(below: 5pt, title)
  }
  box(
    fill: rgb("#DCDCDC"),
    inset: 8pt,
    radius: 4pt,
    body
  )
  if callouts != none {
    for (num, desc) in callouts [
      / #num2unicode(num): #desc
    ]
  }
}

#let uni-colors = state("uni-colors", (:))
#let uni-short-title = state("uni-short-title", none)
#let uni-short-author = state("uni-short-author", none)
#let uni-short-date = state("uni-short-date", none)
#let uni-progress-bar = state("uni-progress-bar", true)

#let university-theme(
  aspect-ratio: "16-9",
  short-title: none,
  short-author: "Ryan Tolboom",
  short-date: none,
  color-a: njit-blue,
  color-b: njit-red,
  color-c: rgb("#FBFEF9"),
  progress-bar: true,
  body
) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 0em,
    header: none,
    footer: none,
  )
  set text(size: 25pt)
  show footnote.entry: set text(size: .6em)
  show link: it => [
    #set text(blue)
    #underline(it)
  ]
  show raw.where(block: false): box.with(
    fill: rgb("#DCDCDC"),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 6pt),
    radius: 2pt,
  )
  show raw.where(block: true): box.with(
    fill: rgb("#DCDCDC"),
    inset: 10pt,
    radius: 4pt,
  )

  uni-progress-bar.update(progress-bar)
  uni-colors.update((a: color-a, b: color-b, c: color-c))
  uni-short-title.update(short-title)
  uni-short-author.update(short-author)
  uni-short-date.update(short-date)

  body
}

#let title-slide(
  title: [],
  subtitle: none,
  authors: "Ryan Tolboom",
  institution-name: "New Jersey Institute of Technology",
  date: none,
  logo: pad(right: 1em, top: 1em, image("njit_logo.svg")),
) = {
  let authors = if type(authors) ==  "array" { authors } else { (authors,) }

  let content = context {
    let colors = uni-colors.get()

    if logo != none {
      align(right, logo)
    }

    align(center + horizon, {
      block(
        inset: 0em,
        breakable: false,
        {
          text(size: 2em, fill: colors.a, strong(title))
          if subtitle != none {
            parbreak()
            text(size: 1.2em, fill: colors.a, subtitle)
          }
        }
      )
      set text(size: .8em)
      grid(
        columns: (1fr,) * calc.min(authors.len(), 3),
        column-gutter: 1em,
        row-gutter: 1em,
        ..authors.map(author => text(fill: black, author))
      )
      if institution-name != none {
        parbreak()
        text(size: .9em, institution-name)
      }
      parbreak()
      image("cc-by-nc.svg", height: 1em)
      if date != none {
        parbreak()
        text(size: .8em, date)
      }
    })
  }

  logic.polylux-slide(content)
}


#let slide(
  title: none,
  header: none,
  footer: none,
  new-section: none,
  body
) = {

  let body = pad(x: 2em, y: .5em, body)
  
  let progress-barline = context {
    if uni-progress-bar.get() {
      let cell = block.with( width: 100%, height: 100%, above: 0pt, below: 0pt, breakable: false )
      let colors = uni-colors.get()

      utils.polylux-progress( ratio => {
        grid(
          rows: 2pt, columns: (ratio * 100%, 1fr),
          cell(fill: colors.a),
          cell(fill: colors.b)
        )
      })
    } else { [] }
  }

  let header-text = {
    if header != none {
      header
    } else if title != none {
      if new-section != none {
        utils.register-section(new-section)
      }
      context {
        let colors = uni-colors.get()
        block(fill: colors.c, inset: (x: .5em), grid(
          columns: (60%, 40%),
          align(top + left, heading(level: 2, text(fill: colors.a, title))),
          align(top + right, text(fill: colors.a.lighten(65%), utils.current-section))
        ))
      }
    } else { [] }
  }

  let header = {
    set align(top)
    grid(rows: (auto, auto), row-gutter: 3mm, progress-barline, header-text)
  }

  let footer = {
    set text(size: 10pt)
    set align(center + bottom)
    let cell(fill: none, it) = rect(
      width: 100%, height: 100%, inset: 1mm, outset: 0mm, fill: fill, stroke: none,
      align(horizon, text(fill: white, it))
    )
    if footer != none {
      footer
    } else {
      context {
        let colors = uni-colors.get()

        show: block.with(width: 100%, height: auto, fill: colors.b)
        grid(
          columns: (25%, 1fr, 15%, 10%),
          rows: (1.5em, auto),
          cell(fill: colors.a, [#uni-short-author.get() #link("https://creativecommons.org/licenses/by-nc/4.0")[CC BY-NC 4.0]]),
          cell(uni-short-title.get()),
          cell(uni-short-date.get()),
          cell(logic.logical-slide.display() + [~/~] + utils.last-slide-number)
        )
      }
    }
  }


  set page(
    margin: ( top: 2em, bottom: 1em, x: 0em ),
    header: header,
    footer: footer,
    footer-descent: 0em,
    header-ascent: .6em,
  )

  logic.polylux-slide(body)
}

#let focus-slide(background-color: rgb("#071D49"), background-img: none, body) = {
  let background-color = if background-img == none and background-color ==  none {
    rgb("#0C6291")
  } else {
    background-color
  }

  set page(fill: background-color, margin: 1em) if background-color != none
  set page(
    background: {
      set image(fit: "stretch", width: 100%, height: 100%)
      background-img
    },
    margin: 1em,
  ) if background-img != none

  set text(fill: white, size: 2em)

  logic.polylux-slide(align(horizon, body))
}

#let matrix-slide(columns: none, rows: none, ..bodies) = {
  let bodies = bodies.pos()

  let columns = if type(columns) == "integer" {
    (1fr,) * columns
  } else if columns == none {
    (1fr,) * bodies.len()
  } else {
    columns
  }
  let num-cols = columns.len()

  let rows = if type(rows) == "integer" {
    (1fr,) * rows
  } else if rows == none {
    let quotient = calc.quo(bodies.len(), num-cols)
    let correction = if calc.rem(bodies.len(), num-cols) == 0 { 0 } else { 1 }
    (1fr,) * (quotient + correction)
  } else {
    rows
  }
  let num-rows = rows.len()

  if num-rows * num-cols < bodies.len() {
    panic("number of rows (" + str(num-rows) + ") * number of columns (" + str(num-cols) + ") must at least be number of content arguments (" + str(bodies.len()) + ")")
  }

  let cart-idx(i) = (calc.quo(i, num-cols), calc.rem(i, num-cols))
  let color-body(idx-body) = {
    let (idx, body) = idx-body
    let (row, col) = cart-idx(idx)
    let color = if calc.even(row + col) { white } else { silver }
    set align(center + horizon)
    rect(inset: .5em, width: 100%, height: 100%, fill: color, body)
  }

  let content = grid(
    columns: columns, rows: rows,
    gutter: 0pt,
    ..bodies.enumerate().map(color-body)
  )

  logic.polylux-slide(content)
}

// display side-by-side slides alternating the image on the left/right
// also resizes text to fit in a single page
#let alternate-counter = counter("alternate-counter")
#let alternate(title: none, image: none, text: none) = {
    slide(title: title)[
      #let text = resize-text(text)
      #alternate-counter.step()
      #context [
        #let value = alternate-counter.get().first()
        #let image-on-left = calc.odd(value)
        #grid(columns: (1fr, 1fr), gutter: 20pt)[
          #v(1fr)
          #if image-on-left { image } else { text }
          #v(1fr)
        ][
          #v(1fr)
          #if image-on-left { text } else { image }
          #v(1fr)
        ]
      ]
    ]
}
