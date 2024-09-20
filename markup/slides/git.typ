#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [git],
)

#title-slide(
  title: [git],
)

#slide(title: [What is git?],
  side-by-side[
    #v(1fr)
    #image("/images/git.svg", width: 100%)
    #v(1fr)
  ][
    #v(1fr)
    - a version control system
    - command line based
    - keeps track of files and changes to them
    - works locally but can "push" to a remote
    #v(1fr)
  ]
)

#slide(title: [What do people think of git?],
  align(center, image("/images/git-bingo.png"))
)

#slide(title: [Why do we need it?],
  side-by-side[
    #v(1fr)
    - make things less brittle
    - keep track of things
    - find out who changed things
    #v(1fr)
  ][
    #image("/images/why-git.png")
  ]
)

#slide(title: [How is it used?],
  side-by-side[
    #align(center, image("/images/xkcd-git.png"))
  ][
    #v(1fr)
    - create a repo: `git init` (local or remote, GitHub can do this for you)
    - clone the repo: `git clone`
    - add files you want tracked: `git add`
    - commit changes: `git commit`
    - push changes: `git push`
    #v(1fr)
  ]
)

#slide(title: [How do I collaborite with git?])[
  #align(center, image("/images/git-branch.png"))
  - fork a repo (create a branch)
  - make your changes
  - submit a PR
  - PR gets merged (hopefully)
]

#slide(title: [Why are we talking about git in a sysadmin class?],
  side-by-side[
    #v(1fr)
    - configurations a typically lots of little files we need to track
    - Docker Compose projects can be tracked in git
    - Kubernetes projects can be tracked in git
    - git helps with change management
    #v(1fr)
  ][
    #v(1fr)
    #image("/images/git-push-git-paid.gif")
    #v(1fr)
  ]
)

#slide(title: [git services],
  side-by-side[
    #grid(columns: (1fr, 1fr), rows: (1fr, 1fr), gutter: 40pt,
      image("/images/github-logo.svg", width: 100%),
      image("/images/gitlab-logo.svg", height: 100%),
      image("/images/sourcehut-logo.svg", width: 100%),
      image("/images/radicle-logo.svg", height: 100%),
    )
  ][
    #v(1fr)
    - #link("https://github.com")[GitHub]
    - #link("https://gitlab.com")[GitLab]
    - #link("https://sr.ht")[SourceHut]
    - #link("https://radicle.xyz")[Radicle (p2p, v1.0 just came out!)]
    #v(1fr)
  ]
)
