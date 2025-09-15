#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [Runtimes],
)

#title-slide(
  title: [Container Runtimes],
)

#alternate(
  title: [Background],
  image: licensed-image(
    file: "/images/cgroups.jpg",
    license: "CC BY-NC-SA 4.0",
    title: [cgroups],
    url: "https://wizardzines.com/comics/cgroups/",
    author: [Julia Evans],
    author-url: "https://wizardzines.com/",
  ), text: [
    - Recall that containers are largely just #link("https://en.wikipedia.org/wiki/Linux_namespaces")[namespaces] and #link("https://en.wikipedia.org/wiki/Cgroups")[cgroups]
    - A container runtime is the software that is used to support the containerization of software
  ]
)

#alternate(
  title: [What specifically does a runtime do?],
  image: licensed-image(
    file: "/images/runtimes.png",
    license: "FAIRUSE",
    title: "Cloud Native Landscape",
    url: "https://landscape.cncf.io/guide#runtime",
    author: [The Linux Foundation],
    author-url: "https://www.linuxfoundation.org/",), text: [
    - image management
    - lifecycle management
    - creation
    - resource management
  ]
)

#slide(title: [Docker (original)])[
  - One of the first runtimes, and as such many things strive to be Docker compatible.
  - Runs on many platforms and is easy to use
  - Extremely popular _not just for the runtime_ but also for the tools that work with it such as their container registry Docker Hub.
  - Supports app containers
  - Requires a daemon to be running as root
  - Losing ground in the production environment, but still common on dev machines
]

#slide(
  title: [Old Docker],
  align(center, licensed-image(
      file: "/images/old-docker.png",
      license: "FAIRUSE",
      title: [Docker and OCI Runtimes],
      url: "https://medium.com/@avijitsarkar123/docker-and-oci-runtimes-a9c23a5646d6",
      author: [Avijit Sarkar],
      author-url: "https://medium.com/@avijitsarkar123",
  ))
)

#slide(title: [containerd])[
  #align(center, licensed-image(
      file: "/images/containerd.png",
      license: "FAIRUSE",
      title: [containerd logo],
      url: "https://containerd.io",
      author: [The Linux Foundation],
      author-url: "https://www.linuxfoundation.org/",
      width: 50%,
  ))
  - Born from the Open Container Initiative (OCI) which was created to make open standards for containers
  - Daemon that runs in the background and supports app containers (sound familiar?)
  - Relies on a lower-level tool called runc (written by Docker)
  - Current versions of Docker run on containerd
]

#slide(title: [runc])[
  #align(center, licensed-image(
      file: "/images/runc.png",
      license: "FAIRUSE",
      title: "runc logo",
      url: "https://github.com/opencontainers/runc",
      author: [Open Container Initiative],
      author-url: "https://github.com/opencontainers",
      width: 75%
  ))
  - Universal, lightweight container runtime
  - Designed for security
  - No Docker dependencies
  - Supports a very simple model of container execution
]

#slide(title: [New Docker],
  align(center, licensed-image(
      file: "/images/new-docker.png",
      license: "FAIRUSE",
      title: [Docker and OCI Runtimes],
      url: "https://medium.com/@avijitsarkar123/docker-and-oci-runtimes-a9c23a5646d6",
      author: [Avijit Sarkar],
      author-url: "https://medium.com/@avijitsarkar123",
  ))
)

#alternate(
  title: [CRI-O],
  image: licensed-image(
    file: "/images/cri-o.png",
    license: "FAIRUSE",
    title: [Introducing CRI-O 1.0],
    url: "https://redhat.com/en/blog/introducing-cri-o-10",
    author: [Joe Brockmeier],
    author-url: "https://www.redhat.com/en/authors/joe-brockmeier",
  ),
  text: [
    - Implements Kubernetes Container Runtime Interface (CRI) with OCI standards
    - Runs as a daemon
    - Support app containers
    - Bridges the gap between K8s and containers, no need to run a `docker` command in-between
    - Not meant for use by devs
  ]
)

#alternate(
  title: [Podman],
  image: licensed-image(
    file: "/images/podman.png",
    license: "FAIRUSE",
    title: [podman logo],
    url: "https://podman.io",
    author: "Podman Container Tools",
    author-url: "https://podman.io",
    width: 100%,
  ),
  text: [
    - daemonless tool to use OCI containers
    - has a similar CLI to `docker`
    - supports similar features as `docker`
    - Linux only
  ]
)

#alternate(
  title: [LXC],
  image: licensed-image(
    file: "/images/lxc.svg",
    license: "CC BY-NC-SA 4.0",
    title: [LXC logo],
    url: "https://linuxcontainers.org",
    author: "LinuxContainers",
    author-url: "https://linuxcontainers.org",
  ),
  text: [
    - Container engine designed for _system_ containers
    - Rootless, daemonless, and fast
    - Keep this in mind if you encounter a _tough_ virtualization feature
    - Works with tools Linux admins are already familiar with
    - Linux only
  ]
)

#alternate(
  title: [Just for fun: #link("https://github.com/p8952/bocker")[Bocker]],
  image: licensed-image(
    file: "/images/container-funny.png",
    license: "FAIRUSE",
    title: [You should use docker - it's so light weight!],
    url: "https://www.reddit.com/r/ProgrammerHumor/comments/zg4wso/you_should_use_docker_its_so_light_weight/",
    author: [AdequateSteve],
    author-url: "https://www.reddit.com/user/AdequateSteve/",
    width: 100%,
  ),
  text: [
    - A lot of what Docker does can be implemented in around 100 lines of BASH!
    - Remember these are things that are _already_ built in to the Linux kernel
    - Obviously Linux only
  ]
)

#alternate(
  title: [What does this mean?],
  image: licensed-image(
    file: "/images/docker-funny.png",
    license: "FAIRUSE",
    title: [Docker does have some favorites though...],
    url: "https://blog.stackademic.com/devops-notes-for-developers-what-is-docker-59d056345916",
    author: [Michael],
    author-url: "https://medium.com/@micodin0plant",
    width: 100%
  ),
  text: [
    - As a sysadmin, you have options
    - Almost all Linux-based
    - A few kernel features can spawn a massive shift in software deployment
  ]
)

#alternate(
  title: [Don't forget to demo...],
  image: licensed-image(
    file: "/images/terminal.png",
    license: "CC BY-SA 4.0",
    title: [Terminal-linux-ubuntu.png],
    url: "https://commons.wikimedia.org/wiki/File:Terminal-linux-ubuntu.png",
    author: [Ricardoborges],
    author-url: "https://commons.wikimedia.org/wiki/File:Terminal-linux-ubuntu.png", 
  ),
  text: [
    - the Docker daemon running
    - a `docker save` to show the structure of the filesystem
  ],
)
