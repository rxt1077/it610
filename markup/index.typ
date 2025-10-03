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

= Systems Administration Resources

This website houses presentations and exercises for teaching Linux systems administration with containers.

All resources are generated using #link("https://github.com/typst/typst")[Typst], are available on #link("https://github.com/rxt1077/it610")[GitHub], and are licensed under #link("https://creativecommons.org/licenses/by-nc/4.0/")[CC BY-NC 4.0]

The current syllabus can be found #link("syllabus.pdf")[here].

== Presentations

The presentations are listed in the order they are used.

Italics indicated that a presentation still needs to be converted to use the Typst template.

+ #link("slides/unix.html")[_UNIX Systems_]
+ #link("slides/containers.html")[_System Administration with Containers_]
+ #link("slides/best-practices.html")[_Best Practices_]
+ #link("slides/terminal.html")[_Terminal Tips and Tricks_]
+ #link("slides/docker.html")[_Docker Best Practices_]
+ #link("slides/project.html")[_The Project_]
+ #link("slides/users.pdf")[Users and Permissions]
+ #link("slides/packages.pdf")[Package Management in Linux]
+ #link("slides/storage.html")[_Storage_]
+ #link("slides/backup.html")[_Backups_]
+ #link("slides/automation.pdf")[Automation]
+ #link("slides/orchestration.pdf")[Orchestration]
+ #link("slides/k8s.pdf")[Kubernetes]
+ #link("slides/ha-postgres-in-k8s.pdf")[High Availability Postgres in Kubernetes]
+ #link("slides/runtimes.pdf")[Container Runtimes]
+ #link("slides/k8s-deployment.pdf")[Deploying an Application on Kubernetes]
+ #link("slides/compose.pdf")[Docker Compose]
+ #link("slides/cloud.pdf")[Cloud Computing]
+ #link("slides/buzz.pdf")[DevOps, SRE, and other Buzzwords]
+ #link("slides/git.pdf")[Git]
+ #link("slides/missing.pdf")[What's Missing?]

== Exercises

/* takes typst exercise files and returns a link to the pdf output with the goals in a list underneath */
#let exercise-item(exercise-file) = {
    let exercise-pdf = exercise-file.trim(".typ", at: end, repeat: false) + ".pdf"
    import exercise-file as exercise
    [
        #link(exercise-pdf)[#exercise.exercise-name]
        #for goal in exercise.goals [
            - #goal
        ]
    ]
}

The exercises are listed in the order they are used with the learning goals that they cover.

Italics indicated that an exercises still needs to be converted to use the Typst template.

#enum(
    exercise-item("exercises/getting-started.typ"),
    exercise-item("exercises/create-image.typ"),
    [
        #link("exercises/exercise-3.html")[_Exercise 3_]
        - Installing GAM on an Ubuntu container via their installation script
        - Creating a Debian package for GAM
        - Creating a Dockerfile for a container that installs GAM from your package
    ],
    exercise-item("exercises/volumes.typ"),
    exercise-item("exercises/hello-k8s.typ"),
    exercise-item("exercises/db-k8s.typ"),
    exercise-item("exercises/compose.typ"),
    exercise-item("exercises/dev-env.typ"),
)

]]]
