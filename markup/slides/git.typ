#import "/templates/slides.typ": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond

#show: university-theme.with(
  short-title: [git],
)

#title-slide(
  title: [git],
)

#alternate(
  title: [What is git?],
  image: licensed-image(
    file: "/images/git.svg",
    license: "FAIRUSE",
    title: [git logo],
    url: "https://git-scm.com/downloads/logos",
    width: 100%,
  ),
  text: [
    - a version control system
    - command line based
    - keeps track of files and changes to them
    - works locally but can "push" to a remote
  ]
)

#slide(title: [What do people think of git?],
  align(center, licensed-image(
    file: "/images/git-bingo.png",
    license: "CC BY-NC-SA 4.0",
    title: [git discussion bingo],
    url: "https://wizardzines.com/comics/git-discussion-bingo/",
    author: [Julia Evans],
    author-url: "https://wizardzines.com/",
  ))
)

#alternate(
  title: [Why do we need it?],
  image: [
    #set text(size: 16pt)
    #diagram(
      node-shape: rect,
      node((0, 0), [Collaboration], stroke: red, fill: red.lighten(80%)),
      node((1, 0), [Open Source], stroke: orange, fill: orange.lighten(80%)),
      node((2, 0), [Scalable], stroke: yellow, fill: yellow.lighten(80%)),
      node((0, 1), [Distributed], stroke: green, fill: green.lighten(80%)),
      node((1, 1), [git], stroke: blue, shape: diamond, fill: blue.lighten(80%)),
      node((2, 1), [Workflow], stroke: purple, fill: purple.lighten(80%)),
      node((0, 2), [Integrity], stroke: yellow, fill: yellow.lighten(80%)),
      node((1, 2), [Branching], stroke: red, fill: red.lighten(80%)),
      node((2, 2), [History], stroke: orange, fill: orange.lighten(80%)),
      edge((1, 1), (0.25, 0.25), "->"),
      edge((1, 1), (1, 0.25), "->"),
      edge((1, 1), (1.75, 0.25), "->"),
      edge((1, 1), (0.25, 1), "->"),
      edge((1, 1), (1.75, 1), "->"),
      edge((1, 1), (0.25, 1.75), "->"),
      edge((1, 1), (1, 1.75), "->"),
      edge((1, 1), (1.75, 1.75), "->"),
    )
  ],
  text: [  
    - make things less brittle
    - keep track of things
    - find out who changed things
  ]
)

#alternate(
  title: [How is it used?],
  image: licensed-image(
    file: "/images/xkcd-git.png",
    license: "CC BY-NC 2.5",
    title: [Git],
    url: "https://xkcd.com/1597/",
    author:[Randall Munroe],
    author-url: "https://xkcd.com/about/",
  ),
  text: [
    - create a repo: `git init` (local or remote, GitHub can do this for you)
    - clone the repo: `git clone`
    - add files you want tracked: `git add`
    - commit changes: `git commit`
    - push changes: `git push`
  ]
)

#slide(title: [How do I collaborate with git?])[
  #diagram(
    node-shape: circle,
    node-fill: njit-red,
    edge-stroke: 8pt + njit-blue.lighten(50%),
    spacing: (4.8em, 4em),
    label-size: 0.8em,
    node((0, 0), " "),
    node((1, 1), " ", fill: njit-blue),
    node((2, 1), " ", fill: njit-blue),
    node((3, 1), " ", fill: njit-blue),
    node((4, 1), " "),
    node((5, 1), " "),
    node((6, 0), " "),
    edge((0, 0), (6, 0), label: [main], stroke: 8pt + njit-red.lighten(50%)),
    edge((0, 0), (1, 1), label: [fork], bend: -30deg, label-angle: auto),
    edge((1, 1), (3, 1), label: [user makes changes], label-side: right),
    edge((3, 1), (4, 0),
      label: [pull request],
      stroke: (paint: njit-blue.lighten(50%), thickness: 8pt, dash: ("dot", 0.5em)),
      bend: -30deg,
      label-angle: auto,
      label-side: left,
      label-sep: 0.7em,
    ),
    edge((3, 1), (5, 1), label: [maintainer adds commits], label-side: right),
    edge((5, 1), (6, 0), label: [merge], bend: -30deg, label-angle: auto),
  )
  \

  - fork a repo (create a branch)
  - make your changes
  - submit a PR
  - PR gets merged (hopefully)
]

#alternate(
  title: [Why are we talking about git in a sysadmin class?],
  image: licensed-image(
    file: "/images/git-push-git-paid.svg",
    license: "CC BY-NC 4.0",
    title: [git-push-git-paid.svg],
    url: "https://github.com/rxt1077/it610/blob/master/markup/images/git-push-git-paid.svg",
    author: [Ryan Tolboom],
    author-url: "https://using.tech",
  ),
  text: [
    - configurations a typically lots of little files we need to track
    - Docker Compose projects can be tracked in git
    - Kubernetes projects can be tracked in git
    - git helps with change management
  ]
)

#alternate(
  title: [git services],
  image: block(breakable: false)[
    #set align(center)
    #set text(8pt)
    #grid(columns: (1fr, 1fr), rows: (40%, 40%), gutter: 40pt,
      image("/images/github-logo.svg", height: 100%),
      image("/images/gitlab-logo.svg", height: 100%),
      image("/images/sourcehut-logo.svg", height: 100%),
      image("/images/radicle-logo.svg", height: 100%),
    )
    GitHub, GitLab, SourceHut, and Radicle logos are used under fair use.
  ],
  text: [
    - #link("https://github.com")[GitHub]
    - #link("https://gitlab.com")[GitLab]
    - #link("https://sr.ht")[SourceHut]
    - #link("https://radicle.xyz")[Radicle (p2p, v1.0 just came out!)]
  ],
)
