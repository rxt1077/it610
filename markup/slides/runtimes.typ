#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [Runtimes],
)

#title-slide(
  title: [Container Runtimes],
)

#slide(title: [Background], side-by-side[
  #v(1fr)
  - Recall that containers are largely just #link("https://en.wikipedia.org/wiki/Linux_namespaces")[namespaces] and #link("https://en.wikipedia.org/wiki/Cgroups")[cgroups]
  - A container runtime is the software that is used to support the containerization of software
  #v(1fr)
][
  #v(1fr)
  #image("/images/cgroups.jpg")
  #v(1fr)
])

#slide(title: [What specifically does a runtime do?], side-by-side[
  #align(center, [
    #v(1fr)
    #image("/images/runtimes.png")
    #text(12pt, link("https://landscape.cncf.io/guide#runtime")[Source: Cloud Native Landscape])
    #v(1fr)
  ])
][
  #v(1fr)
  - image management
  - lifecycle management
  - creation
  - resource management
  #v(1fr)
])

#slide(title: [Docker (original)])[
  - One of the first runtimes, and as such many things strive to be Docker compatible.
  - Runs on many platforms and is easy to use
  - Extremely popular _not just for the runtime_ but also for the tools that work with it such as their container registry Docker Hub.
  - Supports app containers
  - Requires a daemon to be running as root
  - Losing ground in the production environment, but still common on dev machines
]

#slide(title: [Old Docker], align(center, image("/images/old-docker.png")))

#slide(title: [containerd])[
  #align(center, image("/images/containerd.png", height: 30%))
  - Born from the Open Container Initiative (OCI) which was created to make open standards for containers
  - Daemon that runs in the background and supports app containers (sound familiar?)
  - Relies on a lower-level tool called runc (written by Docker)
  - Current versions of Docker run on containerd
]

#slide(title: [runc])[
  #align(center, image("/images/runc.png", height: 30%))
  - Universal, lightweight container runtime
  - Designed for security
  - No Docker dependencies
  - Supports a very simple model of container execution
]

#slide(title: [New Docker], align(center, image("/images/new-docker.png")))

#slide(title: [CRI-O], side-by-side[
  #v(1fr)
  - Implements Kubernetes Container Runtime Interface (CRI) with OCI standards
  - Runs as a daemon
  - Support app containers
  - Bridges the gap between K8s and containers, no need to run a `docker` command in-between
  - Not meant for use by devs
  #v(1fr)
][
  #image("/images/cri-o.png")
])

#slide(title: [Podman], side-by-side[
  #v(1fr)
  #image("/images/podman.png", width: 100%)
  #v(1fr)
][
  #v(1fr)
  - daemonless tool to use OCI containers
  - has a similar CLI to `docker`
  - supports similar features as `docker`
  - Linux only
  #v(1fr)
])

#slide(title: [LXC], side-by-side[
  #v(1fr)
  - Container engine designed for _system_ containers
  - Rootless, daemonless, and fast
  - Keep this in mind if you encounter a _tough_ virtualization feature
  - Works with tools Linux admins are already familiar with
  - Linux only
  #v(1fr)
][
  #v(1fr)
  #image("/images/lxc.svg")
  #v(1fr)
])

#slide(title: [Just for fun: #link("https://github.com/p8952/bocker")[Bocker]], side-by-side[
  #v(1fr)
  #image(width: 100%, "/images/container-funny.png") 
  #v(1fr)
][
  #v(1fr)
  - A lot of what Docker does can be implemented in around 100 lines of BASH!
  - Remember these are things that are _already_ built in to the Linux kernel
  - Obviously Linux only
  #v(1fr)
])

#slide(title: [What does this mean?], side-by-side[
  #v(1fr)
  - As a sysadmin, you have options
  - Almost all Linux-based
  - A few kernel features can spawn a massive shift in software deployment
  #v(1fr)
][
  #v(1fr)
  #image(width: 100%, "/images/docker-funny.png")
  #v(1fr)
])

#slide(title: [Don't forget to demo...], side-by-side[
  #v(1fr)
  #image("/images/terminal.png")
  #v(1fr)
][
  #v(1fr)
  - the Docker daemon running
  - a `docker save` to show the structure of the filesystem
  #v(1fr)
])
