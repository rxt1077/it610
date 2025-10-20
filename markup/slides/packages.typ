#import "/templates/slides.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let title = [Package Management in Linux]
#let outcomes = ("use-pkg", "archive")

#show: university-theme.with(
  short-title: [Packages],
)

#title-slide(
  title: title
)

#let blob(pos, label, tint: white, ..args) = node(
  pos, align(center, label),
  fill: tint.lighten(60%),
  stroke: 1pt + tint.darken(20%),
  shape: rect,
  corner-radius: 5pt,
  ..args,
)

#let outline(label, ..args) = node(
  align(top, pad(top: 0.5em, label)),
  stroke: 1pt + black,
  shape: rect,
  ..args,
)

#focus-slide()[What is Linux?]

#slide(
  title: [What is Linux?],
  [
    #align(center + horizon, diagram(
      spacing: 2em,
      blob((0,2), [Applications (some GNU)], tint: red, name: <apps>),
      blob((0,3), [Libraries (some GNU)], tint: green, name: <libs>),
      blob((0,4), [Linux Kernel], tint: blue, name: <kernel>),
      edge(<apps>, <libs>, "<|-|>"),
      edge(<libs>, <kernel>, "<|-|>"),
      outline([Compiled with GNU Tools], enclose: ((0,1), <apps>, <libs>, <kernel>), name: <compiled>),
      outline([GNU/Linux Distribution], enclose: ((0,0), <compiled>), name: <gnulinux>),
    ))
  ]
)

#alternate(
  title: link("https://man7.org/linux/man-pages/man7/libc.7.html")[libc],
  image: licensed-image(
    file: "/images/libc.png",
    title: [libc],
    url: "https://wizardzines.com/comics/libc/",
    license: "CC BY-NC-SA 4.0",
    author: [Julia Evans],
    author-url: "https://wizardzines.com",
  ),
  text: [
    - Standard C Libraries on Linux
    - Used by all common UNIX tools
    - Most common is glibc (GNU libc), but there is also uClibc, dietlibc, and musl libc
    - Small libc libraries are increasingly popular in containers
  ],
)


#alternate(
  title: [Purpose],
  image: licensed-image(
    file: "/images/packages.png",
    title: [Parcel Parcels Packages],
    url: "https://www.needpix.com/photo/download/1011233/parcel-parcels-packages-delivery-box-service-shipping-cardboard-package",
    license: "PUBLIC",
    author: [harshahars],
    author-url: "https://pixabay.com",
  ),
  text: [
    - Linux systems are made up of a large collection of software
    - Package management makes it easy to upgrade/install/remove individual pieces of software
    - What kind of software are we talking about?
    - Dependency tracking is the largest hurdle and different distributions handle it in different ways
  ],
)

#focus-slide()[
  There are many different Linux distributions available.
  Let's look at how some of them handle package management.
]

#alternate(
  title: [Slackware],
  image: licensed-image(
    file: "/images/slackware.svg",
    title: [Slackware logo],
    url: "https://commons.wikimedia.org/wiki/File:Slackware_logo.svg",
    license: "PUBLIC",
    author: [bobmoser],
    author-url: "http://www.kde-look.org/usermanager/search.php?username=bobmoser",
  ),
  text: [
    - #link("https://computing.help.inf.ed.ac.uk/FAQ/whats-tarball-or-how-do-i-unpack-or-create-tgz-or-targz-file")[tarballs] of files
    - simplest and oldest
    - no dependency tracking
  ],
)

#alternate(
  title: [Debian/Ubuntu],
  image: licensed-image(
    file: "/images/debian.svg",
    title: [Debian-OpenLogo.svg],
    url: "https://commons.wikimedia.org/wiki/File:Debian-OpenLogo.svg",
    license: "CC BY-SA 3.0",
    author: [debian],
    author-url: "https://debian.org",
    width: 60%,
  ),
  text: [
    - dpkgs usually installed with apt or another front end
    - allows scripting
    - has _extensive_ dependency management
  ],
)

#alternate(
  title: [Redhat/Rockylinux/Fedora],
  image: licensed-image(
    file: "/images/redhat.svg",
    title: [Red Hat logo],
    url: "https://en.m.wikipedia.org/wiki/File:Red_Hat_logo.svg",
    license: "PUBLIC",
    author: [Red Hat],
    author-url: "https://www.redhat.com/",
    width: 75%,
  ),
  text: [
    - RPMs usually installed with yum or another front end
    - allows scripting
    - has extensive dependency management
  ],
)

#alternate(
  title: [Gentoo],
  image: licensed-image(
    file: "/images/gentoo.svg",
    title: [Gentoo logo],
    url: "https://www.gentoo.org/inside-gentoo/artwork/gentoo-logo.html",
    license: "CC BY-SA 2.5",
    author: [Lennart Andre Rolland],
    author-url: "https://www.gentoo.org",
  ),
  text: [
    - source based ebuilds (BSD lineage)
    - allows scripting
    - has dependency management
  ],
)

#alternate(
  title: [Arch (BTW...)],
  image: licensed-image(
    file: "/images/arch.svg",
    title: [Arch Linux "Crystal" icon],
    url: "https://en.m.wikipedia.org/wiki/File:Arch_Linux_%22Crystal%22_icon.svg",
    license: "GPLv2",
    author: [Jude Vinet, Aaron Griffin, and Levente Polyák],
    author-url: "https://archlinux.org"
  ),
  text: [
    - PKGBUILD source system that creates binary packages
    - packages can be installed with pacman
    - allows scripting
    - has dependency management
  ],
)

#slide(
  title: [Rolling Releases vs. Point Releases],
  [
    - Most distributions have point releases where MAJOR changes will be a new version and the old versions will continue to be supported for a certain amount of time (LTS)
    - Arch and Gentoo use the rolling release model where each package is updated to the latest version as it becomes available
  ]
)

#alternate(
  title: [Why should I update?],
  image: licensed-image(
    file: "/images/update.jpg",
    title: [Software Update],
    url: "https://www.publicdomainpictures.net/en/view-image.php?image=280716&picture=software-update",
    license: "PUBLIC",
    author: [Mahmoud Hassan],
    author-url: "https://www.publicdomainpictures.net/en/view-image.php?image=280716&picture=software-update",
  ),
  text: [
    - Security patches
    - Mature software in a point release actually doesn’t change that much
    - What if something breaks?
      - Backups and filesystem snapshots
      - #link("https://unix.stackexchange.com/questions/79050/can-i-rollback-an-apt-get-upgrade-if-something-goes-wrong")[“Rollback” apt]
      - Triage your updates
      - What if something _is going_ to break?
  ],
)

#slide(
  title: [apt],
  [
    #align(center, [
      #box(baseline: 15%, rect(fill: red)[#text(size:2em)[A]])dvanced
      #box(baseline: 15%, rect(fill: green)[#text(size:2em)[P]])ackage
      #box(baseline: 15%, rect(fill: blue)[#text(size:2em)[T]])ool
    ])

    - Used in Debian based systems to allow updating and installing packages from repositories
    - Partly a front end for dpkg
    - Most of the things you used to use apt-get for can now be done with the apt binary
    - `apt update`: Download package lists from repositories
    - `apt upgrade`: Upgrade packages from repositories
    - `apt full-upgrade`: Remove packages if needed to make dependencies work (used to be `apt-get dist-upgrade`)
  ]
)

#slide(
  title: [Functional Package Management], toolbox.side-by-side[
    - A relatively new way of doing things where you can have _multiple_ versions of packages in isolation. Each package has _exactly_ what it needs.
    - Our example provide stand-alone package managers since the packages are installed in an independent store. This has helped with adoption.
  ][
    #align(center + horizon, circle(fill: yellow, text(size:4em)[$ lambda x.x $]))
  ]
)

#alternate(
  title: link("https://nixos.org/")[NixOS],
  image: licensed-image(
    file: "/images/nix.svg",
    url: "https://commons.wikimedia.org/wiki/File:Nix_Snowflake_Logo.svg",
    title: [Nix Snowflake Logo],
    license: "CC BY 4.0",
    author: [Tim Cuthbertson],
    author-url: "https://github.com/NixOS",
  ),
  text: [
    - Declarative system structure
    - Atomic upgrades
    - Rollbacks
    - Reproducible system configurations (container replacers?)
    - Lots of symlinks!
  ],
)

#alternate(
  title: link("https://guix.gnu.org/")[GUIX (pronounced GEEKS)],
  image: licensed-image(
    file: "/images/guix.svg",
    url: "https://commons.wikimedia.org/wiki/File:Guix_logo.svg",
    title: [Guix logo],
    license: "CC BY-SA 4.0",
    author: [Luis Felipe López Acevedo],
    author-url: "https://guix.gnu.org",
  ),
  text: [
    - Based on Nix, so everything mentioned previously
    - Guile scheme as base language instead of a DSL
    - Emphasis on free (as in freedom) software
  ],
)

#slide(
  title: [Environment Specific Package Managers],
  toolbox.side-by-side[
    #v(2em)
    #grid(
      columns: (1fr, 1fr),
      rows: (33%, 33%),
      gutter: 1em,
      align(bottom, image("/images/pip.svg")),
      align(bottom, image("/images/npm.svg")),
      grid.cell(
        colspan: 2,
        align(top + center, image("/images/cargo.png"))
      )
    )
    #text(size: 0.25em)[#link("https://commons.wikimedia.org/wiki/File:PyPI_logo.svg")[PyPI Logo] by Python Packaging Authority / Python Software Foundation is licensed under #link("https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt")[GPLv2], #link("https://commons.wikimedia.org/wiki/File:Npm-logo.svg")[NPM Logo] is in the public domain, and #link("https://doc.rust-lang.org/cargo/images/Cargo-Logo-Small.png")[Cargo Logo Small] is licensed under #link("https://github.com/rust-lang/cargo/blob/master/LICENSE-MIT")[MIT]]
  ][
    #align(horizon)[
      - pip - Python package manager
      - npm - NodeJS package manager
      - cargo - Rust package manager #link("https://doc.rust-lang.org/book/ch14-04-installing-binaries.html")[(this isn't intended to replace system packages)]
    ]
  ]
)

#alternate(
  title: [Why talk about package management?],
  image: licensed-image(
    file: "/images/question.jpg",
    title: [Question Mark on Chalk Board],
    url: "https://www.pexels.com/photo/question-mark-on-chalk-board-356079/",
    license: "CC0",
  ),
  text: [
    - Many problems solved by complex virtualization solutions are actually package management issues
    - Applications may rely on environment package managers which can cause headaches
    - Knowing how to package things makes deployment much easier
  ]
)
