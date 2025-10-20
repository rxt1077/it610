/* Outcomes are used by the throughout the course so we define them here and
   import them in the syllabus, exercises, slides, index, etc. */
#let outcomes = (
  "Linux": (
    shell:       [Access a shell prompt and issue commands with correct syntax],
    ssh:         [Access remote systems using SSH],
    archive:     [Archive, compress, unpack, and uncompress files using tar, gzip, and bzip2],
    text:        [Create and edit text files],
    files:       [Create, delete, copy, and move files and directories],
    users:       [Add users, reset passwords, modify user groups, and delete users], 
    git:         [Basic git operations],
    permissions: [List, set, and change file permissions],
    use-pkg:     [Utilize a package management system],
    create-pkg:  [Create a package],
  ),
  "Containers": (
    manage-containers: [Configure container engines, create, and manage containers],
    create-images:     [Create a container image],
    build-images:      [Build a container image],
    create-volumes:    [Create and backup container volumes],
    deploy-db:         [Deploy a database in a container],
  ),
  "Container Orchestration": (
    orchestration:     [Use a container orchestration system to run a multi-container environment],
    automation:        [Automate a deployment using popular automation tools],
    custom-deployment: [Design a custom deployment for a development environment],
  ),
)
