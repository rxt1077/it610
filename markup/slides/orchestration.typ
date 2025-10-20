#import "/templates/slides.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let title = [Orchestration]
#let outcomes = ("manage-containers", "orchestration") 

#show: university-theme.with(
  short-title: [Orchestration],
)

#title-slide(
  title: title,
)

#alternate(
  title: [Purpose],
  image: licensed-image(
    file: "/images/conductor.jpg",
    license: "CC BY-SA 4.0",
    title: [Conductor, balground],
    url: "https://commons.wikimedia.org/wiki/File:Conductor,_balground.jpg",
    author: [Alex Azman],
    author-url: "https://commons.wikimedia.org/w/index.php?title=User:Alex_Azman&action=edit&redlink=1",
  ),
  text: [
    - It is relatively rare to run just one container
    - Modern applications are made up of multiple containers working with each other
    - Resilient applications are made up of multiple containers running on multiple nodes
    - Scalable applications may require containers to be brought up or shut down in response to workload
    - Handling monitoring, starting, stopping, and updating containers _is_ orchestration.
  ],
)

#slide(title: [It Gets Complicated])[
  #set text(size: 0.75em)
  #let service(pos, label, name) = node(
    pos,
    label,
    fill: blue.lighten(60%),
    stroke: 1pt + blue.darken(20%),
    shape: rect,
    corner-radius: 5pt,
    name: name
  )
  #let my-node(label, enclose, name) = node(
    align(top, label),
    enclose: enclose,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    shape: rect,
    corner-radius: 5pt,
    name: name,
    inset: 0.5em,
  )
  #let arrow(node1, node2) = edge(node1, node2, "<|-|>")
  #diagram(
      service((0,2), [Web Server], <web1>),
      service((0,3), [Database Service \ (secondary)], <db1>),
      service((0,4), [Distributed Storage], <store1>),

      arrow(<web1>, <db1>),
      arrow(<db1>, <store1>),

      service((1,2), [Web Server], <web2>),
      service((1,3), [Database Service], <db2>),
      service((1,4), [Distributed Storage], <store2>),

      arrow(<web2>, <db2>),
      arrow(<db2>, <store2>),

      service((2,2), [Web Server], <web3>),
      service((2,3), [Database Service \ (secondary)], <db3>),
      service((2,4), [Distributed Storage], <store3>),

      arrow(<web3>, <db3>),
      arrow(<db3>, <store3>),

      my-node([Node 1 \ (Chicago)], ((0,1), <web1>, <db1>, <store1>), <node1>),
      my-node([Node 2 \ (Seattle)], ((1,1), <web2>, <db2>, <store2>), <node2>),
      my-node([Node 3 \ (New York)],((2,1), <web3>, <db3>, <store3>), <node3>),

      arrow(<db1>, <db2>),
      arrow(<db2>, <db3>),
      arrow(<store1>, <store2>),
      arrow(<store2>, <store3>),

      node(align(top)[Orchestration System], enclose: ((0,0), <node1>, <node2>, <node3>), shape: rect, stroke: black, inset: 1em),
  )
]

#alternate(
  title: [Networking],
  image: licensed-image(
    file: "/images/osi-model.svg", 
    title: [osi model],
    license: "PUBLIC",
    url: "https://freesvg.org/osi-model",
  ),
  text: [
    - Containers need to be able to talk to each other on a _virtual_ network
    - This network may or may not traverse _real_ networks
    - This network may or may not traverse nodes
    - #link("https://docs.docker.com/network/")[Docker supports many network types] but it's still not typically used in production.
    - Isolation is a security feature, but use common sense
  ],
)

#alternate(
  title: [Service Discovery],
  image: licensed-image(
    file: "/images/etcd.png",
    title: [All Cloud Native Infrastructure],
    license: "CC BY-NC 2.5",
    url: "https://github.com/etcd-io/etcd/issues/15765",
    author: [Josh Berkus],
    author-url: "https://github.com/jberkus", 
  ),
  text: [
    - Containers need to be able to find each other
    - This can be handled with services: #link("https://etcd.io/")[etcd], #link("https://www.consul.io/")[consul], #link("https://kubernetes.io")[k8s]
    - This can be handled through DNS: #link("https://docs.docker.com/compose/networking/")[Docker Compose]
  ],
)

#alternate(
  title: [Logging],
  image: licensed-image(
    file: "/images/logging-pipeline.jpg",
    title: [Logging Pipeline Arch Diag],
    license: "CC BY-SA 4.0",
    url: "https://wikitech.wikimedia.org/wiki/File:Logging_Pipeline_Arch_Diag.jpg?uselang=en",
    author: [Keith Herron],
    author-url: "https://meta.wikimedia.org/wiki/User:KHerron_(WMF)",
  ),
  text: [
    - Logs from all of the containers need to be aggregated
    - This is trending towards being one of the jobs of the orchestration system: #link("https://docs.docker.com/compose/networking/")[k8s], #link("https://docs.docker.com/engine/reference/commandline/service_logs/")[Docker (Compose / Swarm)]
    - You can (and maybe should) still do this externally! Things like rsyslog and logstash still work.
  ],
)

#focus-slide()[What options are out there?]

#matrix-slide(columns: 2, rows: 2)[
  #align(top)[ = Docker Compose ]

  #align(left)[
  - Uses a `docker-compose.yml` file to describe multiple services
  - Allows for many of the Docker options you are familiar with
  ]
][
  #align(top)[ = Docker Swarm ]

  #align(left)[
  - Extends the Docker Compose syntax to allow replication and running on multiple nodes
  ]
][
  #align(top)[ = Kubernetes (k8s) ]

  #align(left)[
  - _Very popular_
  - Uses its own syntax for container orchestration
  - Can use multiple container runtimes (docker, containerd, etc.)
  ]
][
  #align(top)[ = Nomad ]

  #align(left)[
  - Simpler than k8s
  - Works with both VMs and containers
  ]
]

#slide(title: [Docker Compose Example])[
  #set align(center + horizon)
  #set text(0.5em)
  #code(
    ```yml
    ----
    version '3'

    volumes:
      web_data: external: true

    services:
      app:
        image: nginx:alpine
        ports:
          - 80:80
        volumes:
          - web_data:/usr/share/nginx/html:ro
      app2:
        image: nginx:alpine
        ports:
          - 8080:80
        volumes:
          - web_data:/usr/share/nginx/html:ro
      app3:
        build: ./app3
    ----
    ```,
    text-size: 13pt
  )
]

#alternate(
  title: [Docker Compose Tips / Resources],
  image: licensed-image(
    file: "/images/docker-logo.svg",
    title: "Docker Logo",
    url: "https://www.svgrepo.com/svg/331370/docker",
    license: "CC0",
  ),
  text: [
    - It's YAML, watch your whitespace
    - #link("https://docs.docker.com/compose/gettingstarted/")[Get started with Docker Compose]
    - #link("https://docs.docker.com/compose/compose-file/")[Compose file version 3 reference]
    - Docker Compose expects a `docker-compose.yml` in the working directory
    - Commands start with `docker-compose` and are similar to docker: `build`, `run`, `exec`, `up`, `down`
    - If you change a Dockerfile, don't forget to rebuild!
    - Use multiple consoles to make seeing what's going on easier
  ]
)

#slide(title: link("https://developer.hashicorp.com/nomad/tutorials/get-started/gs-deploy-job")[Nomad Example])[
  #set align(center + horizon)
  #set text(0.5em)
  #code(
    ```hcl
    job "pytechco-web" {
      type = "service"
      group "ptc-web" {
        count = 1
        network {
          port "web" {
            static = 5000
          }
        }
        service {
          name     = "ptc-web-svc"
          port     = "web"
          provider = "nomad"
        }
        task "ptc-web-task" {
          driver = "docker"
          config {
            image = "ghcr.io/hashicorp-education/learn-nomad-getting-started/ptc-web:1.0"
            ports = ["web"]
          }
        }
      }
    }
    ```,
    text-size: 14pt
  )
]

#alternate(
  title: [Hashicorp Nomad],
  image: licensed-image(
    file: "/images/nomad.png",
    url: "https://github.com/hashicorp/field-workshops-nomad/blob/main/docs/slides/multi-cloud/advanced-nomad/nomad-security.md",
    license: "FAIRUSE",
    title: [Hashicorp Nomad Logo],
    width: 75%,
  ),
  text: [
    - Works with multiple container runtimes and VMs
    - Uses Hashicorp Configuration Language (HCL) and domain specific language
    - Simpler the k8s
    - More configurable that Docker Swarm
    - Free open source version with paid enterprise and managed service offerings
  ],
)
