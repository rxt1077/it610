#import "templates/syllabus.typ": syllabus

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
  outcomes: (
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
  ),
  outline: (
    ( topics: ("Introduction", "UNIX Systems", "Containers"),
      outcomes: ("files", "shell", "git", "manage_containers", "build_images")),
    ( topics: ("Best Practices", "Linux Systems", "Command Line Review",
               "Project Specifications"),
      outcomes: ("shell", "ssh", "files", "permissions")),
    ( topics: ("Permissions", "Managing Users", "Package Management",
               "Project Proposal Due"),
      outcomes: ("shell", "files", "users", "permissions", "text", "use_pkg")),
    ( topics: ("Storage", "File Systems", "Backups"),
      outcomes: ("shell", "files", "permissions", "use_pkg", "create_pkg",
                 "archive", "manage_containers", "create_images", "build_images")),
    ( topics: ("Automation",),
      outcomes: ("shell", "files", "create_volumes", "automation")),
    ( topics: ("Patterns of Virtualization",),
      outcomes: ("shell", "manage_containers", "create_images", "build_images",
                 "create_volumes")),
    ( topics: ("Backups", "Disaster Recovery"),
      outcomes: ("shell", "archive", "manage_containers", "create_images",
                 "build_images", "create_volumes", "deploy_db")),
    ( topics: ("Midterm Exam", "Midterm Project Due"),
      outcomes: ("shell", "ssh", "archive", "text", "files", "users", "git",
                 "permissions", "use_pkg", "create_pkg", "manage_containers",
                 "create_images", "build_images", "create_volumes", "deploy_db",
                 "automation")),
    ( topics: ("Infrastructure as a Service",),
      outcomes: ("shell", "ssh", "manage_containers", "orchestration")),
    ( topics: ("Container Runtime Options",),
      outcomes: ("shell", "manage_containers", "orchestration", "deploy_db",
                 "custom_deployment")),
    ( topics: ("Container Orchestration",),
      outcomes: ("shell", "manage_containers", "orchestration", "deploy_db",
                 "custom_deployment")),
    ( topics: ("Load Balancing", "High Availability"),
      outcomes: ("shell", "manage_containers", "deploy_db", "orchestration")),
    ( topics: ("Update Cycles", "DevOps"),
      outcomes: ("shell", "manage_containers", "build_images", "create_images",
                 "create_volumes", "orchestration")),
    ( topics: ("Kubernetes", "Cloud Deployments"),
      outcomes: ("shell", "orchestration", "custom_deployments", "ssh")),
    ( topics: ("Final Exam Review", "Project Work Session"),
      outcomes: ("shell", "ssh", "archive", "text", "files", "users", "git",
                 "permissions", "use_pkg", "create_pkg", "manage_containers",
                 "create_images", "build_images", "create_volumes", "deploy_db",
                 "orchestration", "automation", "custom_deployment")),
  ),
  doc,
)

== Additional Resources
The following web pages will be very helpful while working on projects:
- #link("https://canvas.njit.edu")[Canvas] - be sure your credentials are up to date
- #link("https://hub.docker.com")[Docker Hub] - most images have excellent documentation

== Project Guidelines

Each project will be given a set of common deliverables that all student projects must meet for credit.
Individual project deliverables will be settled upon after submission of the project proposal.
The midterm project will be a basic, single-container deployment.
The final project will utilize multiple containers and an orchestration framework.
#pagebreak()
