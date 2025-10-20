/* General utilities for working with outcomes */

/* Steps through the outcomes to build the expanded form */
#let walk-outcomes(key: "", value: (:), enum: ()) = {
  /* if it's a dictionary it's a section containing outcomes or other sections */
  if type(value) == dictionary {
    let counter = 1
    let section = (
      _type: "section",
      enum: enum,
      heading: key,
      elements: (),
    )
    for (next-key, next-value) in value {
      section.elements.push(walk-outcomes(key: next-key, value: next-value, enum: enum + (counter,)))
      counter += 1
    }
    return section
  }
      
  /* if it's content we're at an outcome */
  if type(value) == content {
    return (_type: "outcome", enum: enum, key: key, body: value)
  }

  /* if we get here it's a problem! */
  panic("invalid outcome structure")
}

/* Steps through outcomes building an array of keys */
#let walk-keys(node, keys) = {
    if node._type == "outcome" {
      keys.push(node.key)
      return keys
    }
    if node._type == "section" {
      for element in node.elements {
        keys = walk-keys(element, keys)
      }
      return keys
    }
    panic("unknown outcome type")
}

/* Panics if there are duplicate keys in the outcomes */
#let check-outcomes(outcomes) = {
  let keys = walk-keys(outcomes, ())
  while keys.len() > 0 {
    let check-key = keys.pop()
    if check-key in keys {
      panic("duplicate key in outcomes: " + check-key)
    }
  }
}

/* Converts the outcomes from the brief, simple form:
   (
     "Section 1": (
       first: [Section 1, first outcome],
       second: [Section 1, second outcome],
       third: [Section 1, third outcome],
      ),
      "Section 2": (
      ...
    )
    To an expanded, enumerated format that is easily parsed:
    (
      (
        _type: "section",
        enum: (1,),
        heading: "Section 1",
        elements: (
          (
            _type: "outcome",
            enum: (1, 1),
            key: "first",
            body: [Section 1, first outcome],
          ),
          (
            _type: "outcome",
            enum: (1, 2),
            key: "second",
            body: [Section 1, second outcome],
          ),
          (
            _type: "outcome",
            enum: (1, 3),
            key: "third",
            body: [Section 1, third outcome],
          ),
        ),
      ),
      (
        _type: "section",
        enum: (2,),
        heading: "Section 2",
        elements: (
        ...
      ),
    )
*/
#let build-outcomes(outcomes) = {
  let full-outcomes = walk-outcomes(key: "Learning Outcomes", value: outcomes, enum: ())
  check-outcomes(full-outcomes)
  return full-outcomes
}

/* returns an outcome based on it's key */
#let get-outcome(node, key) = {
  if node._type == "section" {
    for element in node.elements {
      let result = get-outcome(element, key)
      if result != none {
        return result
      }
    }
    return none
  }
  if node._type == "outcome" {
    if node.key == key {
      return node
    }
    return none
  }

  panic("unknown type in outcomes")
}
  
#let print-outcomes(node, depth: 2) = {
  if node._type == "section" {
    let title = node.enum.map(str).join(".")
    if depth > 2 {
      title += "."
    }
    heading(depth: depth)[#title #node.heading]
    for next-node in node.elements {
      print-outcomes(next-node, depth: depth + 1)
    }
    return
  }
  if node._type == "outcome" {
    context {
      if target() == "html" {
        html.elem("div", attrs: (class: "outcome"))[
          #html.elem("span", attrs: (class: "outcome-num"),  node.enum.map(str).join("."))
          #html.elem("span", attrs: (class: "outcome-body"), node.body)
        ]
      } else {
        grid(columns: (2.5em, 1fr))[#node.enum.map(str).join(".")][#node.body]
      }
    }
    return
  }
}
