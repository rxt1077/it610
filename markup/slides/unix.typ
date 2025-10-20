#import "/templates/slides.typ": *

#let title = [UNIX Systems]
#let outcomes = ("shell",)

#show: university-theme.with(
  short-title: [UNIX],
)

#title-slide(
  title: title,
)

#slide(
  title: [What is this?],
  licensed-image(
    file: "/images/holmdel1.jpg",
    title: [Bell Labs Holmdel],
    url: "https://commons.wikimedia.org/wiki/File:Bell_Labs_Holmdel.jpg",
    author: [MBisanz],
    author-url: "https://commons.wikimedia.org/wiki/User:MBisanz",
    license: "CC BY-SA 2.0",
    width: 75%,
  )
)

#slide(
  title: [Beautiful Inside],
  licensed-image(
    file: "/images/bell-works.jpg",
    title: [The first floor of Bell Works in 2022],
    url: "https://en.wikipedia.org/wiki/Bell_Labs_Holmdel_Complex#/media/File:Bell_Works_first_floor_46.jpg",
    author: [Curlyrnd],
    author-url: "https://commons.wikimedia.org/wiki/User:Curlyrnd",
    license: "CC BY-SA 4.0",
    width: 75%,
  ),
)

#slide(
  title: [Transistor water tower],
  licensed-image(
    file: "/images/bell-labs-water-tower.jpg",
    title: [Bell Labs water tower NJ1],
    url: "https://commons.wikimedia.org/wiki/File:Bell_Labs_water_tower_NJ1.jpg",
    author: [Acroterion],
    author-url: "https://commons.wikimedia.org/wiki/User:Acroterion",
    license: "CC BY-SA 4.0",
  ),
)

#alternate(
  title: [Multics],
  image: licensed-image(
    file: "/images/multics-logo.svg",
    title: [Multics-logo],
    url: "https://commons.wikimedia.org/wiki/File:Multics-logo.svg",
    author: [VectorVoyager],
    author-url: "https://commons.wikimedia.org/wiki/User:VectorVoyager",
    license: "CC BY-SA 4.0",
  ),
  text: [
    - MIT, AT&T, and GE
    - Timesharing system for mainframes
    - Monolithic
    - Mainframe time was expensive
    - #link("http://web.mit.edu/multics-history/")[Unwieldy code]
  ],
)

#focus-slide()[
  #set text(30pt)
  "What we wanted to preserve was not just a good environment in which to do programming, but a system around which a fellowship could form.
  We knew from experience that the essence of communal computing, as supplied by remote-access, time-shared machines, is not just to type programs into a terminal instead of a keypunch, but to encourage close communication." -- Dennis Ritchie
]

#alternate(
  title: [Inception],
  image: block(breakable: false, width: 100%)[
    #set align(center)
    #set text(size: 8pt)
    #block(below: 5pt)[#image("/images/thompson-ritchie.jpg")]
    Collection of the Computer History Museum, #link("https://www.computerhistory.org/collections/catalog/102685442")[102685442]
  ],
  text: [
    - Smaller group of developers (Ken Thompson, Dennis Ritchie, Doug McIlroy, Joe Ossanna…)
    - Smaller code base
    - Simulations on old Multics mainframes later developed on PDP-7/PDP-11/20
    - Man pages were a HUGE development
    - Anti-trust suit means they have to give it away
  ],
)

#alternate(
  title: [Growth],
  image: licensed-image(
    file: "/images/c-book.svg",
    title: [The C Programming Language, First Edition Cover],
    url: "https://commons.wikimedia.org/wiki/File:The_C_Programming_Language,_First_Edition_Cover.svg",
    author: [Julesmazur],
    author-url: "https://commons.wikimedia.org/wiki/User:Julesmazur",
    license: "PUBLIC",
  ),
  text: [
    - Rewritten in C
    - Takes over Bell Labs
    - BSD Unix developed as an alternative to Bell Labs restrictive licensing
    - Standards develop (System V, POSIX)
    - Alternatives grow in parallel (Minix, Linux, etc.)
  ],
)

#alternate(
  title: [Key Concepts],
  image: licensed-image(
    file: "/images/puzzle-pieces.png",
    title: [Jigsaw Puzzle],
    url: "https://www.publicdomainpictures.net/en/view-image.php?image=362343&picture=jigsaw-puzzle",
    author: [vector studio],
    author-url: "https://www.vecteezy.com/members/vectorstudio",
    license: "PUBLIC",
  ),
  text: [
    - Do one thing well
    - Everything is a file
    - Pipes
    - Document
    - Have good manuals and _make_ people read them
    - Steep learning curve but high productivity
    - Multiuser by design
    - Networking by design
    - Uptime
  ],
)

#focus-slide(
  align(center, link("https://upload.wikimedia.org/wikipedia/commons/7/77/Unix_history-simple.svg")[UNIX Family Tree])
)

#alternate(
  title: [Linux],
  image: licensed-image(
    file: "/images/tux.svg",
    title: [Tux],
    url: "https://commons.wikimedia.org/wiki/File:Tux.svg",
    author: [Larry Ewing],
    author-url: "https://isc.tamu.edu/~lewing/",
    license: "CC0",
  ),
  text: [
    - Developed in 1991 by Linus Torvalds, meant for x86 but lots of ports today
    - Linux is the kernel, there are many distributions
  ],
)

#matrix-slide(columns: 3, rows: 1)[
  == Debian Based
  - Debian
  - Ubuntu
    - Mint
][
  == Redhat Based
  - RHEL (Redhat Enterprise Linux)
  - Rockylinux 
  - Amazon Linux
][
  == Other
  - Arch
  - Slackware
]

#alternate(
  title: [What's next?],
  image: licensed-image(
    file: "/images/redox.jpg",
    title: [RedoxOS Logo],
    url: "https://www.redox-os.org/",
    license: "FAIRUSE",
    width:50%,
  ),
  text: [
    - Microkernels?
    - #link("https://www.redox-os.org/")[Redox?]
    - Functional Package Management? (#link("https://guix.gnu.org/")[GUIX], #link("https://nixos.org")[Nix])
  ],
)

#focus-slide(link("http://dreamsongs.com/RiseOfWorseIsBetter.html")[Counterpoint: The Rise of Worse is Better])
