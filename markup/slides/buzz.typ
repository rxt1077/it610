#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [Buzzwords],
)

#title-slide(
  title: [DevOps, SRE, and other Buzzwords],
)

#focus-slide()[
  What does a sysadmin do?
]

#matrix-slide()[
  Configure
  #licensed-image(
    file: "/images/configure-icon.svg",
    license: "cc0",
    title: [Settings SVG Vector],
    url: "https://www.svgrepo.com/svg/13688/settings",
  )
][
  Operate
  #licensed-image(
    file: "/images/operate-icon.svg",
    license: "cc0",
    title: [Press Button SVG Vector],
    url: "https://www.svgrepo.com/svg/58818/press-button",
  )
][
  Maintain
  #licensed-image(
    file: "/images/maintain-icon.svg",
    license: "cc0",
    title: [Wrench SVG Vector],
    url: "https://www.svgrepo.com/svg/535743/wrench",
  )
]

#alternate(
  title: [DevOps Patterns],
  image: licensed-image(
    file: "/images/devops.svg",
    license: "cc-by-sa-4",
    title: [Devops-toolchain.svg],
    url: "https://upload.wikimedia.org/wikipedia/commons/0/05/Devops-toolchain.svg",
    author: [Kharnagy],
    author-url: "https://commons.wikimedia.org/wiki/User:Kharnagy",
  ),
  text: [
    - Hardware in the cloud
    - Everything is code
    - "YAML engineers"
    - Devs doing sysadmin or sysadmins doing dev?
  ],
)

#alternate(
  title: [Site Reliability Engineering (SRE)],
  image: licensed-image(
    file: "/images/sre.jpg",
    license: "cc-by-nc-nd-4",
    title: [Service Reliability Hierarchy],
    url: "https://sre.google/sre-book/part-III-practices/#fig_part-practices_reliability-hierarchy",
    author: [Betsy Beyer, Chris Jones, Niall Richard Murphy, Jennifer Petoff],
    author-url: "https://www.oreilly.com/library/view/site-reliability-engineering/9781491929117/",
  ),
  text: [
    - Change management
    - Automation
    - CI/CD Pipelines
    - Testing
    - "Treat operations as if it's a software problem." -- Google
  ],
)

#slide(
  title: [Is the Sysadmin Dead?],
  side-by-side(columns: (33%, 1fr))[
    #v(1fr)
    #rect(
      stroke: 4pt,
      width: 60%,
      height: 60%,
      radius: (
        top-left: 20%,
        top-right: 20%
      ),
      fill: gray,
      [
        #v(20%)
        #h(20%)
        #text(size: 50pt, weight: "bold", [RIP \ ])
        #h(10%)
        #text(size: 30pt, style: "italic", [sysadmin])
      ]
    )
    #v(1fr)
  ][
    #v(1fr)
    - Nope, they're just coding more
    - Expertise in uptime and hardware optimization helps solve software problems
    - An empowered sysadmin can do more, much more
    - Experience matters
    #v(1fr)
  ]
)

#alternate(
  title: [What does it all mean?],
  image: image("/images/sysadmin-heroes.svg"),
  text: [
    - Failure is an option!
    - A whole lot of virtualization
    - Continuous deployment is expected
    - Rapid (automated) response
    - Downtime for maintenance is passe
    - Make it run on anything
    - Automate, automate, automate!
    - Save configurations, not images
  ],
)

#focus-slide()[
  What solutions are we using _now_?
]

#matrix-slide(columns: 3, rows: 3)[
  *Automation Tools* \
  Ansible \
  Terraform \
  Chef/Puppet
][
  *VMs* \
  Amazon EC2 \
  Digital Ocean \
  Linode
][
  *Containers* \
  LXC \
  K8s \
  Podman
][
  *Reproducible Systems* \
  NixOS \
  GUIX
][
  *Function as a Service* \
  AWS Lambda \
  Google Cloud Functions \
  Azure Functions
][
  *Platform as a Service* \
  Heroku \
  Fly.io \
  Railway.app
][
  *Immutable Linux* \
  ChromeOS \
  Vanilla OS \
  Endless OS
][
  *Hybrid Cloud* \
  OpenStack, K8s, etc. \
  Any big IaaS
][
  *Self-Hosted AI*
]

#slide(
  title: [How do we keep up?],
  [
    - We've talked about and used lots of tools, but they aren't the only ones
    - Concepts > Use Instances
    - Read, share, contribute
    - Learn from past mistakes
    - Don't believe the hype. Think for yourself!
    - Argue and learn
    - Insular sysadmin culture _is_ dead
    - My personal thoughts on the future: distributed, decentralized, federated, mesh
  ]
)
