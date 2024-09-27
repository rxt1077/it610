// general styling
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

#place(top + right, image("templates/njit_logo.svg"))

= IT 610 Systems Administration

#grid(
  columns: 2,
  gutter: 8pt,
  [*Instructor*], [Ryan Tolboom],
  [*Email*], [Ryan.Tolboom\@njit.edu],
  [*Office*], [3500 Guttenberg Information Technologies Center (GITC)],
  [*Office Hours*], [4:00PM to 5:30PM on Tuesdays or via Zoom (email to schedule)]
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

This course is a hands-on project intensive exploration of the advanced topics in systems administration.
In addition to learning core competencies administering a Linux environment, students will also learn about the best practices for supporting a system or multi-server system in a containerized environment.
Students will work on a single container image for the midterm project and a multi-container system for the final project.

#columns(2)[
    == Grading
    - 20% Exercises
    - 20% Midterm Exam
    - 20% Midterm Project
    - 20% Final Exam
    - 20% Final Project

    #colbreak()
    == Course Materials
    - #link("https://www.docker.com/products/docker-desktop/")[Docker Desktop]
    - #link("https://git-scm.com/downloads")[git]
    - A #link("https://github.com")[GitHub] account
]
== Additional Resources
The following web pages will be very helpful while working on projects:
- #link("https://canvas.njit.edu")[Canvas] - be sure your credentials are up to date
- #link("https://hub.docker.com")[Docker Hub] - most images have excellent documentation

== Project Guidelines

Each project will be given a set of common deliverables that all student projects must meet for credit.
Individual project deliverables will be settled upon after submission of the project proposal.
The midterm project will be a basic, single instance deployment.
The final project will utilize multiple containers and an orchestration framework.
#pagebreak()

// we use outcomes in a few places, so it's stored in a dictionary
#let outcomes = (
    "Linux": (
        shell: "Access a shell prompt and issue commands with correct syntax",
        ssh: "Access remote systems using SSH",
        archive: "Archive, compress, unpack, and uncompress files using tar, gzip, and bzip2",
        text: "Create and edit text files",
        files: "Create, delete, copy, and move files and directories",
        users: "Add users, reset passwords, modify user groups, and delete users", 
        git: "Basic git operations",
        permissions: "List, set, and change file permissions",
        use_pkg: "Utilize a package management system",
        create_pkg: "Create a package"
    ),
    "Containers": (
        manage_containers: "Configure container engines, create, and manage containers",
        create_images: "Create a container image",
        build_images: "Build a container image",
        create_volumes: "Create and backup container volumes",
        deploy_db: "Deploy a database in a container"
    ),
    "Container Orchestration": (
        orchestration: "Use a container orchestration system to run a multi-container environment",
        automation: "Automate a deployment using popular automation tools",
        custom_deployment: "Design a custom deployment for a development environment"
    )
)

// the course outline is also stored in a dictionary so we can cross-list the
// weeks that learning outcomes are addressed
#let outline = (
  (
    topics: ("Introduction", "UNIX Systems", "Containers"),
    outcomes: ("files", "shell", "git", "manage_containers", "build_images")
  ),
  (
    topics: ("Best Practices", "Linux Systems", "Command Line Review",
             "Project Specifications"),
    outcomes: ("shell", "ssh", "files", "permissions")
  ),
  (
    topics: ("Permissions", "Managing Users", "Package Management",
    "Project Proposal Due"),
    outcomes: ("shell", "files", "users", "permissions", "text", "use_pkg")
  ),
  (
    topics: ("Storage", "File Systems", "Backups"),
    outcomes: ("shell", "files", "permissions", "use_pkg", "create_pkg",
    "archive", "manage_containers", "create_images", "build_images")
  ),
  (
    topics: ("Automation",),
    outcomes: ("shell", "files", "create_volumes", "automation")
  ),
  (
    topics: ("Patterns of Virtualization",),
    outcomes: ("shell", "manage_containers", "create_images", "build_images",
               "create_volumes")
  ),
  (
    topics: ("Backups", "Disaster Recovery"),
    outcomes: ("shell", "archive", "manage_containers", "create_images", "build_images",
               "create_volumes", "deploy_db")
  ),
  (
    topics: ("Midterm Exam", "Midterm Project Due"),
    outcomes: ("shell", "ssh", "archive", "text", "files", "users", "git",
               "permissions", "use_pkg", "create_pkg", "manage_containers",
               "create_images", "build_images", "create_volumes", "deploy_db",
               "automation")
  ),
  (
    topics: ("Infrastructure as a Service",),
    outcomes: ("shell", "ssh", "manage_containers", "orchestration")
  ),
  (
    topics: ("Container Runtime Options",),
    outcomes: ("shell", "manage_containers", "orchestration", "deploy_db",
               "custom_deployment")
  ),
  (
    topics: ("Container Orchestration",),
    outcomes: ("shell", "manage_containers", "orchestration", "deploy_db",
               "custom_deployment")
  ),
  (
    topics: ("Load Balancing", "High Availability"),
    outcomes: ("shell", "manage_containers", "deploy_db", "orchestration")
  ),
  (
    topics: ("Update Cycles", "DevOps"),
    outcomes: ("shell", "manage_containers", "build_images", "create_images",
               "create_volumes", "orchestration")
  ),
  (
    topics: ("Kubernetes", "Cloud Deployments"),
    outcomes: ("shell", "orchestration", "custom_deployments", "ssh")
  ),
  (
    topics: ("Final Exam Review", "Project Work Session"),
    outcomes: ("shell", "ssh", "archive", "text", "files", "users", "git",
               "permissions", "use_pkg", "create_pkg", "manage_containers",
               "create_images", "build_images", "create_volumes", "deploy_db",
               "orchestration", "automation", "custom_deployment")
  )
)

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
