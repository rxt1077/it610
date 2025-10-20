#import "outcomes.typ": outcomes
#import "templates/utils.typ": get-outcome, build-outcomes, print-outcomes

#let outcomes = build-outcomes(outcomes)

#html.elem("html")[
#html.elem("head")[
    #html.elem("meta", attrs: (charset: "utf-8"))
    #html.elem("meta", attrs: (name: "viewport", content: "width=device-width, initial-scale=1"))
    #html.elem("link", attrs: (href: "https://fonts.googleapis.com/css?family=Roboto", rel: "stylesheet"))
    #html.elem("link", attrs: (rel: "stylesheet", href: "css/exercise.css"))
    #html.elem("title", "Sysadmin")
]
#html.elem("body")[
#html.elem("div", attrs: (class: "content"))[

= Linux Systems Administration with Containers

This website houses free, open source resources for teaching Linux systems administration with containers.

All resources are created using #link("https://github.com/typst/typst")[Typst], are available on #link("https://github.com/rxt1077/it610")[GitHub], and are licensed under #link("https://creativecommons.org/licenses/by-nc/4.0/")[CC BY-NC 4.0]

The current syllabus can be found #link("syllabus.pdf")[here].

_Italics_ indicate that a resource still needs to be converted to use a Typst template.

#print-outcomes(outcomes)

== Presentations

/* takes Typst slides files and returns a link to the pdf output with the outcomes in a list underneath */
#let slides-item(slides-file) = [
    #let slides-pdf = slides-file.trim(".typ", at: end, repeat: false) + ".pdf"
    #import slides-file as slides
    #link(slides-pdf)[#slides.title]
    #for outcome in slides.outcomes.map(key => get-outcome(outcomes, key)).sorted(key: it => it.enum) [
        - #outcome.enum.map(str).join(".") #outcome.body
    ]
]

The presentations are listed in the order they are used with the learning outcomes that they cover.

#enum(
  slides-item("slides/unix.typ"),
  par(link("slides/containers.html")[_System Administration with Containers_]),
  par(link("slides/best-practices.html")[_Best Practices_]),
  par(link("slides/terminal.html")[_Terminal Tips and Tricks_]),
  par(link("slides/docker.html")[_Docker Best Practices_]),
  par(link("slides/project.html")[_The Project_]),
  slides-item("slides/users.typ"),
  slides-item("slides/packages.typ"),
  slides-item("slides/storage.typ"),
  slides-item("slides/backup.typ"),
  slides-item("slides/automation.typ"),
  slides-item("slides/orchestration.typ"),
  slides-item("slides/k8s.typ"),
  slides-item("slides/ha-postgres-in-k8s.typ"),
  slides-item("slides/runtimes.typ"),
  slides-item("slides/k8s-deployment.typ"),
  slides-item("slides/compose.typ"),
  slides-item("slides/cloud.typ"),
  slides-item("slides/buzz.typ"),
  slides-item("slides/git.typ"),
  slides-item("slides/missing.typ"),
)

== Exercises

/* takes typst exercise files and returns a link to the pdf output with the outcomes in a list underneath */
#let exercise-item(exercise-file) = {
    let exercise-pdf = exercise-file.trim(".typ", at: end, repeat: false) + ".pdf"
    import exercise-file as exercise
    [
        #link(exercise-pdf)[#exercise.exercise-name]
        #for outcome in exercise.outcomes.map(key => get-outcome(outcomes, key)).sorted(key: it => it.enum) [
            - #outcome.enum.map(str).join(".") #outcome.body
        ]
    ]
}

The exercises are listed in the order they are used with the learning outcomes that they cover.

#enum(
    exercise-item("exercises/getting-started.typ"),
    exercise-item("exercises/create-image.typ"),
    exercise-item("exercises/create-deb.typ"),
    exercise-item("exercises/volumes.typ"),
    exercise-item("exercises/hello-k8s.typ"),
    exercise-item("exercises/db-k8s.typ"),
    exercise-item("exercises/compose.typ"),
    exercise-item("exercises/dev-env.typ"),
)

]]]
