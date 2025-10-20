/* template for a general NJIT syllabus */
#import "utils.typ": build-outcomes, get-outcome, print-outcomes

#let outcomes-from-keys(keys, outcomes) = {
  for outcome in keys.dedup()
                     .map(key => get-outcome(outcomes, key))
                     .sorted(key: it => it.enum) [
    - #outcome.enum.map(str).join(".") #outcome.body
  ]
}

#let syllabus( 
  course: none,
  instructor: [Ryan Tolboom],
  email: [Ryan.Tolboom\@njit.edu],
  office: [3506 Guttenberg Information Technologies Center (GITC)],
  office-hours: none,
  objective: none,
  grading: none,
  course-materials: none,
  outcomes: none,
  outline: none,
  base-url: "https://rxt1077.github.io/it610",
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

  == Student Absences for Religious Observations

  NJIT is committed to supporting students observing religious holidays.
  Students must notify their instructors in writing of any conflicts between course requirements and religious observances, ideally by the end of the second week of classes and no later than two weeks before the anticipated absence.
  All instructors must include a reminder on the course syllabus about this notification process.
  All instructors are required to provide academically reasonable accommodations, allowing students to complete missed assignments, exams, quizzes, or other coursework within the term.
  Instructors are encouraged to consider the #link("https://www.njit.edu/inclusive/religious-and-spirituality-resources")[NJIT religious holiday calendar] and exercise cultural sensitivity when scheduling assessments or major assignments.
  All instructors must ensure that students are not penalized for properly documented absences and maintain confidentiality regarding religious observances.
  For questions or additional guidance, please #link("https://www.njit.edu/registrar/njit-policy-student-absences-religious-observances")[review the policy] or contact the Office of Inclusive Excellence at inclusiveexcellence\@njit.edu.
    
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

  #let outcomes = build-outcomes(outcomes)
  #block()[
    #set par(spacing: 0.5em)
    #print-outcomes(outcomes)
  ]

  == Course Outline

  #table(
    columns: (3.5em, 1fr, 1fr, 2fr),
    table.header(
      [*Week*],
      [*Presentations*],
      [*Exercises*],
      [*Learning Outcomes*],
    ),
    ..for week in outline {
      if week._type == "standard" {
        let week-outcomes = ()
        (
          week.week,
          for slides-file in week.slides {
            if type(slides-file) != str {
              [- #slides-file]
            } else {
              let slides-pdf = slides-file.trim(".typ", at: end, repeat: false) + ".pdf"
              import slides-file as slides
              week-outcomes += slides.outcomes
              [- #link(base-url + slides-pdf)[#slides.title]]
            }
          },
          for exercise-file in week.exercises {
            if type(exercise-file) != str {
              [- #exercise-file]
            } else {
              let exercise-pdf = exercise-file.trim(".typ", at: end, repeat: false) + ".pdf"
              import exercise-file as exercise
              week-outcomes += exercise.outcomes
              [- #link(base-url + exercise-pdf)[#exercise.exercise-name]]
            }
          },
          outcomes-from-keys(week-outcomes, outcomes),
        )
      } else if week._type == "exam" {
        (
          week.week,
          table.cell(colspan: 2, week.body),
          outcomes-from-keys(week.outcomes, outcomes),
        )
      }
    }
  )
]
