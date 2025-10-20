#import "/templates/slides.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let title = [Systems Administration with Containers]
#let outcomes = ("manage-containers",)

#show: university-theme.with(
  short-title: [Containers],
)

#title-slide(
  title: title,
)

#alternate(
  title: [What is a container?],
  image: licensed-image(
    file: "/images/containers.jpg",
    license: "CC BY 2.0",
    title: [Multicolored containers],
    url: "https://www.flickr.com/photos/93755244@N00/3144199355",
    author: [Håkan Dahlström],
    author-url: "https://www.flickr.com/photos/93755244@N00",
  ),
  text: [
    - fully contained Linux system that configured exactly how the dev / ops team wants it to be
    - uses chroot / cgoups for isolation
    - allows multiple independant Linux environments to run on one host
    - more lightweight than virtual machines (VMs)
    - typically coordinated through a daemon process (docker for example)
  ],
)

#slide(title: [cgroups?])[
  #licensed-image(
    file: "/images/cgroups.jpg",
    license: "CC BY-NC-SA 4.0",
    title: [cgroups],
    url: "https://wizardzines.com/comics/cgroups/",
    author: [Julia Evans],
    author-url: "https://wizardzines.com/",
  )
]

#let my-node(pos, title, name, tint, options: ()) = {
  let label = [
    #align(center)[*#title*]
    #align(left)[
      #for option in options [
        - #option
      ]
    ]
  ]

  node(
    pos,
    label,
    fill: tint.lighten(60%),
    stroke: 1pt + tint.darken(20%),
    shape: rect,
    corner-radius: 5pt,
    name: name
  )
}

#slide(title: [Docker on a Non-Linux Machine])[
  #set text(size: 0.75em)
  #align(center,
    diagram(
      spacing: (1em, 2em),
      my-node(
        (1,0),
        [Host OS],
        <host>,
        red,
        options: (
          [Windows],
          [MacOS]
        )
      ),
      my-node(
        (1,1),
        [Virtual Machine Running Linux],
        <vm>,
        orange,
        options: (
          [WSL2],
          [Hyper-V],
          [Apple Virtualization Framework],
          [HyperKit]
        ),
      ),
      my-node((1,2), [Docker], <docker>, yellow),
      my-node((0,3), [Container 1], <container1>, green),
      my-node((1,3), [Container 2], <container2>, green),
      my-node((2,3), [Container 3], <container3>, green),
      edge(<host>, <vm>, "-|>"),
      edge(<vm>, <docker>, "-|>"),
      edge(<docker>, <container1>, "-|>"),
      edge(<docker>, <container2>, "-|>"),
      edge(<docker>, <container3>, "-|>"),
    )
  )
]


#slide(title: [Docker on a Linux Machine])[
  #set text(size: 0.75em)
  #v(1fr)
  #align(center,
    diagram(
      spacing: (1em, 2em),
      my-node((1,0), [Host OS], <host>, red, options: ([Linux],)),
      my-node((1,1), [Docker], <docker>, yellow),
      my-node((0,2), [Container 1], <container1>, green),
      my-node((1,2), [Container 2], <container2>, green),
      my-node((2,2), [Container 3], <container3>, green),
      edge(<host>, <docker>, "-|>"),
      edge(<docker>, <container1>, "-|>"),
      edge(<docker>, <container2>, "-|>"),
      edge(<docker>, <container3>, "-|>"),
    )
  )
  #v(1fr)
]

#alternate(
  title: [Precious vs. Expendable],
  image: grid(columns: (1fr, 1fr), rows: 1, gutter: 1em)[
    #align(horizon)[
      #licensed-image(
        file: "/images/diamond.jpg",
        url: "https://commons.wikimedia.org/wiki/File:Diamond_ring_by_Koshyk.jpg",
        title: [Diamond ring],
        author: [Koshy Koshy],
        author-url: "https://www.flickr.com/people/97235261@N00",
        license: "CC BY 2.0",
      )
    ]
  ][
    #licensed-image(
      file: "/images/gumball.jpg",
      url: "https://www.publicdomainpictures.net/en/view-image.php?image=256762&picture=vintage-gumball-machine",
      title: [Vintage Gumball Machine],
      license: "CC0",
    )
  ],
  text: [
    - containers have a brief lifecycle, they are expendable
    - the configuration information for an image matters (Dockerfile)
    - the actual information inside the running container does not
    - store your _data_ somewhere that isn't inside a container, it's precious
  ],
)

#slide(title: [Containers vs. Images])[
  #v(1fr)
  #align(center,
    diagram(
      my-node((1,0), [Image], <image>, green, options: ([scratch], [ubuntu:24.04], [custom software/configuration])),
      my-node((0,1), [Container 1], <container1>, blue),
      my-node((1,1), [Container 2], <container2>, blue),
      my-node((2,1), [Container 3], <container3>, blue),
      edge(<image>, <container1>, "-|>", text(0.75em)[docker run image]),
      edge(<image>, <container2>, "-|>", text(0.75em)[docker run image]),
      edge(<image>, <container3>, "-|>", text(0.75em)[docker run image]),
    )
  )
  #v(1fr)
]

#alternate(
  title: [Wrap it Up!],
  image: licensed-image(
    file: "/images/mummy.svg",
    url: "https://freesvg.org/1551792684",
    title: [Short mummy],
    license: "PUBLIC",
  ),
  text: [
    - traditional Linux systems administration still matters
    - focus on _how_ you set up something more than maintaining a set up you made earlier
    - you should be able to make a script that deploys servers on demand
    - everything is code
  ],
)
