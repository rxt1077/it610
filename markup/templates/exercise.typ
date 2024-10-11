#let primary-color = rgb("#D22630")
#let secondary-color = rgb("#071D49")
#let code-bg-color = rgb("#DCDCDC")

#let exercise(
  course-name: none,
  exercise-name: none,
  doc,
) = {
  set page(
    paper: "us-letter",
    margin: (left: 0.5in, right: 0.5in),
    header: { 
      smallcaps([#course-name Exercise])
      h(1fr)
      emph(exercise-name)
    },
    numbering: "1",
  )
  set text(
    font: "Roboto",
    size: 11pt
  )
  show heading.where(level: 1): it => {
    block(below: 28pt)[#it]
  }
  show heading.where(level: 2): it => [
    #block(below: 3pt,
      grid(columns: 2, gutter: 5pt,
        square(size: 10pt, fill: primary-color),
        text(primary-color)[#it]
      )
    )
    #block(above: 0pt, line(stroke: primary-color, length: 100%))
  ]
  show link: it => [
    #set text(blue)
    #underline(it)
  ]
  show raw.where(block: false): box.with(
    fill: code-bg-color,
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  show quote: it => [
    #grid(
      columns: (5pt, 1fr),
      rows: 1,
      gutter: 0pt,
      grid.cell(fill: secondary-color.lighten(50%))[],
      it,
    )
  ]

  [
    = #exercise-name

    #doc
  ]
}

// ugly hack to convert callout number to a unicode character
#let num2unicode(num) = {
    set text(black, size: 14pt, weight: "bold")
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

// code blocks in boxes with AsciiDoctor style callouts
#let code(body, title: none, callouts: none) = {
  show regex("<[0123456789]>"): it => {
    num2unicode(it.text)
  }
  if title != none {
    set text(secondary-color)
    block(below: 5pt, title)
  }
  box(
    fill: code-bg-color,
    inset: 8pt,
    radius: 4pt,
    width: 100%,
    body
  )
  if callouts != none {
    for (num, desc) in callouts [
      / #num2unicode(num): #desc
    ]
  }
}

// AsciiDoctor style(ish) admonitions for things we want to point out
#let admonition(body, symbol: emoji.face.think, color: secondary-color) = {
  layout(size => {
    set text(size: 10pt)
    let width = 80%
    // most of this logic is to force a minimum height for the admonition
    let height = measure(box(width: (size.width * width), body)).height
    if height < 60pt {
      height = 60pt
    }
    align(center,
      rect(
        width: width,
        stroke: color + 2pt,
        radius: 4pt,
        fill: color.lighten(85%),
        grid(
          rows: height,
          columns: (60pt, 1fr),
          gutter: 10pt,
          // we have to use pad to nudge the symbol up a little
          text(color, font: "Noto Emoji", size: 40pt, align(horizon, pad(bottom: 10pt, symbol))),
          text(color, size: 10pt, align(left + horizon, body))
        )
      )
    )
  })
}
