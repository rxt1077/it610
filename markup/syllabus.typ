#import "templates/syllabus.typ": syllabus
#import "outcomes.typ": outcomes

#show: doc => syllabus(
  course: [IT 610 Systems Administration],
  office-hours: [2:00PM to 4:00PM on Tuesdays or via Zoom (email to schedule)],
  objective: [
    This course is a hands-on project intensive exploration of the advanced topics in systems administration.
    In addition to learning core competencies administering a Linux environment, students will also learn about the best practices for supporting a system or multi-server system in a containerized environment.
    Students will work on a single container image for the midterm project and a multi-container system for the final project.
  ],
  grading: (
    [20% Exercises],
    [20% Midterm Exam],
    [20% Midterm Project],
    [20% Final Exam],
    [20% Final Project]),
  course-materials: (
    [A laptop meeting the #link("https://ist.njit.edu/student-computers-recommended-specs")[YWCC minimum specs]],
    [#link("https://www.docker.com/products/docker-desktop/")[Docker Desktop] installed and working],
    [#link("https://git-scm.com/downloads")[git] installed and working],
    [A #link("https://github.com")[GitHub] account],
  ),
  outcomes: outcomes,
  outline: (
    (
      _type: "standard",
      week: [1],
      slides: ("/slides/unix.typ", "/slides/containers.typ"),
      exercises: ("/exercises/getting-started.typ",)
    ),
    (
      _type: "standard",
      week: [2],
      slides: (
        link("https://rxt1077.github.io/it610/slides/best-practices.html", [Best Practices]),
        link("https://rxt1077.github.io/it610/slides/terminal.html", [Terminal Tips and Tricks]),
        link("https://rxt1077.github.io/it610/slides/docker.html", [Docker Best Practices]),
        link("https://rxt1077.github.io/it610/slides/project.html", [Project]),
      ),
      exercises: ([Project Proposal],)
    ),
    (
      _type: "standard",
      week: [3],
      slides: ("/slides/users.typ", "/slides/packages.typ"),
      exercises: ("/exercises/create-image.typ",),
    ),
    (
      _type: "standard",
      week: [4],
      slides: ("/slides/storage.typ", "/slides/backup.typ"),
      exercises: ("/exercises/create-deb.typ",),
    ),
    (
      _type: "standard",
      week: [5],
      slides: ("/slides/automation.typ",),
      exercises: ("/exercises/volumes.typ",),
    ),
    (
      _type: "standard",
      week: [6],
      slides: ([Midterm Review],),
      exercises: ([Practice Midterm],),
    ),
    (
      _type: "exam",
      week: [7],
      body: [
        - Midterm
        - Midterm Deliverables Due
      ],
      outcomes: (
        "shell", "ssh", "archive", "text", "files", "users", "git",
        "permissions", "use-pkg", "create-pkg", "manage-containers",
        "create-images", "build-images", "create-volumes", "deploy-db"
      ),
    ),
    (
      _type: "standard",
      week: [8],
      slides: (
        "/slides/orchestration.typ",
        "/slides/k8s.typ",
        "/slides/ha-postgres-in-k8s.typ",
      ),
      exercises: ("/exercises/hello-k8s.typ",),
    ),
    (
      _type: "standard",
      week: [9],
      slides: ("/slides/runtimes.typ", "/slides/k8s-deployment.typ"),
      exercises: ("/exercises/db-k8s.typ",),
    ),
    (
      _type: "standard",
      week: [10],
      slides: ("/slides/compose.typ",),
      exercises: ("/exercises/compose.typ",),
    ),
    (
      _type: "standard",
      week: [11],
      slides: ("/slides/cloud.typ", "/slides/buzz.typ"),
      exercises: ("/exercises/dev-env.typ",),
    ),
    (
      _type: "standard",
      week: [12],
      slides: ("/slides/git.typ",),
      exercises: ([GitHub Exploration],),
    ),
    (
      _type: "standard",
      week: [13],
      slides: ("/slides/missing.typ",),
      exercises: ([Updating a Linux Kernel],),
    ),
    (
      _type: "standard",
      week: [14],
      slides: ([Final Review],),
      exercises: ([Practice Final],),
    ),
    (
      _type: "exam",
      week: [15],
      body: [
        - Final
        - Final Deliverables Due
      ],
      outcomes: (
        "shell", "ssh", "archive", "text", "files", "users", "git",
        "permissions", "use-pkg", "create-pkg", "manage-containers",
        "create-images", "build-images", "create-volumes", "deploy-db",
        "orchestration", "automation", "custom-deployment",
      ),
    ),
  ),
  doc,
)

== Additional Resources
The following web pages will be very helpful while working on projects:
- #link("https://canvas.njit.edu")[Canvas] - be sure your credentials are up to date
- #link("https://hub.docker.com")[Docker Hub] - most images have excellent documentation
- #link("https://www.aholdengouveia.name/advlinux.html")[Linux Administration] - this hands-on, OER course in Linux Administration by Adrianna Holden-Gouveia is a great resource for additional help

== Project Guidelines
Each project will be given a set of common deliverables that all student projects must meet for credit.
Individual project deliverables will be settled upon after submission of the project proposal.
The midterm project will be a basic, single-container deployment.
The final project will utilize multiple containers and an orchestration framework.
