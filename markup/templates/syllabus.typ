// template for a general NJIT syllabus

#let syllabus( 
  course: none,
  instructor: [Ryan Tolboom],
  email: [Ryan.Tolboom\@njit.edu],
  office: [3500 Guttenberg Information Technologies Center (GITC)],
  office-hours: none,
  objective: none,
  grading: none,
  course-materials: none,
  outcomes: none,
  outline: none,
  doc,
) = [
  #set page(
    paper: "us-letter",
    margin: (x: 36pt, y: 36pt)
  )

  #set text(
    font: "Roboto",
    size: 10pt
  )

  #show link: it => [
    #set text(blue)
    #underline(it)
  ]

  #place(top + right, image("njit_logo.svg"))

  = #course

  #grid(
    columns: 2,
    gutter: 8pt,
    [*Instructor*], instructor,
    [*Email*], email,
    [*Office*], office,
    [*Office Hours*], office-hours,
  )

  == Academic Integrity

  Academic Integrity is the cornerstone of higher education and is central to the ideals of this course and the university.
  Cheating is strictly prohibited and devalues the degree that you are working on.
  As a member of the NJIT community, it is your responsibility to protect your educational investment by knowing and following the academic code of integrity policy that is found at: #link("https://www5.njit.edu/policies/sites/policies/files/NJIT-University-Policy-on-Academic-Integrity.pdf")[NJIT Academic Integrity Code].

  Please note that it is my professional obligation and responsibility to report any academic misconduct to the Dean of Students Office.
  Any student found in violation of the code by cheating, plagiarizing or using any online software inappropriately will result in disciplinary action. This may include a failing grade of F, and/or suspension or dismissal from the university.
  If you have any questions about the code of Academic Integrity, please contact the Dean of Students Office at dos\@njit.edu.

  == Generative AI

  Student use of artificial intelligence (AI) is permitted in this course for non-exam assignments and activities.
  Additionally, if and when students use AI in this course, the AI must be cited as is shown within the #link("https://researchguides.njit.edu/AI/home")[NJIT Library AI citation page] for AI.
  If you have any questions or concerns about AI technology use in this class, please reach out to your instructor prior to submitting any assignments.

  == Objective

  #objective

  #columns(2)[
      == Grading

      #for item in grading [
        - #item
      ]

      #colbreak()
      == Course Materials

      #for item in course-materials [
        - #item
      ]
  ]

  #doc

  // enumerate the learning outcomes and note which weeks the learning outcomes
  // are reinforced
  #let section_num = 1
  #for (section, outcome_list) in outcomes {
    let outcome_num = 1
    for (key, desc) in outcome_list {
      let weeks = ()
      for (week_num, week) in outline.enumerate() {
        if (key in week.at("outcomes")) {
          weeks.push(week_num + 1)
        }
      }
      outcomes.at(section).at(key) = (
        section_num: section_num,
        outcome_num: outcome_num,
        weeks: weeks,
        description: desc
      )
      outcome_num += 1
   }
   section_num += 1
  }

  == Learning Outcomes

  #let section_num = 1
  #for (section, section_outcomes) in outcomes {
    [=== #section_num. #section]
    grid(
      columns: (16pt, 1fr),
      gutter: 8pt,
      ..for (key, outcome) in section_outcomes {
        (
          [#outcome.at("section_num").#outcome.at("outcome_num")],
          [#outcome.at("description"). Weeks #outcome.at("weeks").map(str).join(", ", last: " and ").]
        )
      }
    )
    section_num += 1
  }

  == Course Outline

  // takes a list of learning outcome keys and returns a sorted (by index), formated
  // text representation of the learning outcomes
  #let print_outcomes(key_list) = {
    let week_outcomes = ()
    for key in key_list {
      // find the learning outcome based on its key
      for (section, outcome_list) in outcomes {
        if (key in outcome_list) {
          week_outcomes.push(outcome_list.at(key))
        }
      }
    }

    // print them out in order
    grid(
      columns: (16pt, 1fr),
      gutter: 8pt,
      ..for outcome in week_outcomes
        // seems hackish but as long as there aren't more than 100 outcomes per
        // per section, this sorting key should work
        .sorted(key: x => (x.at("section_num")*100 + x.at("outcome_num")))
        .dedup() {
          (
            [#outcome.at("section_num").#outcome.at("outcome_num")],
            [#outcome.at("description")]
          )
      }
    )
  }

  #let week_num = 1
  #table(
    columns: (1fr, 2fr, 4fr),
    table.header(
      [*Week*],
      [*Topics*],
      [*Learning Outcomes*],
    ),
    ..for week in outline {
      (
        [#week_num],
        for topic in week.at("topics") [- #topic],
        print_outcomes(week.at("outcomes"))
      )
      week_num += 1
    }
  )
]
