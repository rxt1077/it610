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
  #image("/images/configure-icon.svg")
][
  Operate
  #image("/images/operate-icon.svg")
][
  Maintain
  #image("/images/maintain-icon.svg")
]

#slide(
  title: [DevOps Patterns],
  side-by-side[
    #v(1fr) // this is a hack until align horizon is fixed: https://github.com/andreasKroepelin/polylux/issues/148 
    #image("/images/devops.jpg")
    #v(1fr)
  ][
    #v(1fr)
    - Hardware in the cloud
    - Everything is code
    - "YAML engineers"
    - Devs doing sysadmin or sysadmins doing dev?
    #v(1fr)
  ]
)

#slide(
  title: [Site Reliability Engineering (SRE)],
  side-by-side[
    #v(1fr)
    - Change management
    - Automation
    - CI/CD Pipelines
    - Testing
    - "Treat operations as if it's a software problem." -- Google
    #v(1fr)
  ][
    #v(1fr)
    #image("/images/sre.jpg")
    #v(1fr)
  ]
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

#slide(
  title: [What does it all mean?],
  side-by-side(columns: (60%, 40%))[
    #v(1fr)
    - Failure is an option!
    - A whole lot of virtualization
    - Continuous deployment is expected
    - Rapid (automated) response
    - Downtime for maintenance is passe
    - Make it run on anything
    - Automate, automate, automate!
    - Save configurations, not images
    #v(1fr)
  ][
    #v(1fr)
    #image("/images/sysadmin-heroes.jpg")
    #v(1fr)
  ]
)

#focus-slide(background-color: rgb("#071D49"))[
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
