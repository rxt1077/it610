#import "/templates/slides.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let title = [Best Practices in Systems Administration]
#let outcomes = ("permissions", "automation")

#show: university-theme.with(
  short-title: [Best Practices],
)

#title-slide(
  title: title,
)

#focus-slide()[
  #set text(size: 0.50em, font: "DejaVu Sans Mono")
  #set par(spacing: 0.5em)
  #set align(center)
  #rect(fill: black, stroke: white)[
    BEING A \
    #text(size: 1.5em)[SYSADMIN]
    #rect(fill: white, width: 80%, height: 2em, text(fill: black, 1.5em)[IS EASY])
    IT'S LIKE RIDING A BIKE \
    EXCEPT THE BIKE IS ON FIRE \
    YOU ARE ON FIRE \
    #emoji.fire EVERYTHING IS ON FIRE #emoji.fire
  ]
]

#alternate(
  title: [Scope],
  image: licensed-image(
    file: "/images/scope-creep.jpg",
    url: "https://www.flickr.com/photos/rosenfeldmedia/35473616510",
    title: [PMH034],
    license: "CC BY 2.0",
    author: [Rosenfeld Media],
    author-url: "https://www.flickr.com/photos/rosenfeldmedia/",
  ),
  text: [
    - Define your role and the problem you are addressing
    - *Scope creep* - #link("https://en.wikipedia.org/wiki/Scope_creep")[continuous or uncontrolled growth in a project's scope]
    - Even (especially) internally, an #link("https://www.bmc.com/blogs/sla-template-examples/")[SLA] can help
    - Who is going to maintain this?
    - Who is going to admin this?
    - Don't be in charge of the coffee maker!
  ]
)

#alternate(
  title: link("https://en.wikipedia.org/wiki/KISS_principle")[KISS],
  image: licensed-image(
    file: "/images/kiss.jpg",
    url: "https://upload.wikimedia.org/wikipedia/commons/f/f1/Keep_it_Simple.jpg",
    title: [Keep it Simple],
    license: "CC BY-SA 2.0",
    author: [Jimee, Jacki, Tom & Asha],
    author-url: "https://www.flickr.com/people/64226949@N00",
  ),
  text: [
    - Do you _really_ need that feature? (#link("https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it")[YAGNE])
    - Are you using an open source solution?
    - What happens if you get sick / leave?
    - Does the work flow make sense?
  ],
)

#alternate(
  title: [Document, Document, Document],
  image: licensed-image(
    file: "/images/typing.jpg",
    url: "https://commons.wikimedia.org/wiki/File:Apple-blogging-coder-36990.jpg",
    title: [Apple-blogging-coder-36990],
    license: "CC0",
    author: [Negative Space],
    author-url: "https://www.pexels.com/@negativespace",
  ),
  text: [
    - #link("https://www.markdowntutorial.com/")[Learn markdown, it’ll only take a few minutes]
    - Use #link("https://pandoc.org/")[pandoc] for people who want HTML / PDFs / etc.
    - Write things down like your pedantic sysadmin prof is looking over your shoulder... they might be.
    - You will forget and others need to know
    - Use code documentation tools (docstrings etc...)
  ],
)

#matrix-slide(rows: 3, columns: 3)[
  Google Docs
][
  Wikis
][
  OneNote
][
  #link("https://www.gitbook.com/")[GitBook]
][
  #link("https://antora.org/")[Antora]
][
  Knowledge Bases
][
  A git repository and Markdown
][
  #link("https://www.doxygen.nl/")[doxygen]
][
  #link("https://www.sphinx-doc.org/en/master/")[Sphinx]
]

#alternate(
  title: link("https://en.wikipedia.org/wiki/Don%27t_repeat_yourself")[Don't Repeat Yourself (DRY)],
  image: licensed-image(
    file: "/images/xkcd-write-a-script.png",
    title: [Is it Worth the Time?],
    url: "https://xkcd.com/1205",
    author: [Randall Munroe],
    author-url: "https://xkcd.com",
    license: "CC BY-NC 2.5",
  ),
  text: [
    - Does your script follow the previous KISS principal?
    - Is there data being replicated (including account info)?
    - Should this be using other services? #link("https://en.wikipedia.org/wiki/Single_sign-on")[SSO]? #link("https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol")[LDAP]?
    - Start small, build up
  ],
)

#matrix-slide(rows: 3, columns: 3)[
  BASH
][
  #link("https://www.manning.com/books/learn-windows-powershell-in-a-month-of-lunches-third-edition")[Powershell]
][
  Python
][
  Ansible
][
  Puppet
][
  #link("https://github.com/saltstack/salt")[Salt]
][
  #link("https://www.vagrantup.com/")[Vagrant for VMs]
][
  #link("https://www.docker.com/")[Docker for containers]
][
  Terraform
]

/*
#alternate(
  title: [Build human resource capacity

[.column]
image::wires.jpg[]

[.column]
* Take the time to explain how it works
* Talk to users, sysadmins, and management
* Avoid the ego-boost of being a linchpin
* Be approachable and friendly

[.bg]
== Have a disaster recovery plan

image::fire.jpg[background, size=cover]

* If you have backups and you’ve never practiced recovering from a backup, you
  don’t have backups
* Storage is cheaper than data
* If your good, you'll be a hero. If you're _really_ good, no one will even
  know.

== Use permissions and virtualization. Avoid root access

[.shrink]
* Can I get root? No
* Just about everything can be handled through permissions
* But I’m a dev and I need... No
* But I’m the CTO and I say... No
* I have root on my router at home and it’s only caught on fire three times.
  I think that... No
* I’m not saying to be mean, remember to build HR capacity, but very few
  things still require root access.

== Logging

* Logs are important, have / use a system
* Make them easy to get to and easy to search
* Don’t be afraid to read. What else are you going to do in the morning before
  your brain has had coffee?

== Keep learning / stay positive

* Don’t be afraid to admit you don’t know something
* Don’t be afraid to try something new
* Avoid information hoarders
* Avoid negative people
* Share your knowledge

== System Administration is dead! Long live system administration.

* A systems architect is a large-scale sysadmin with a nice title (and
  hopefully a bigger paycheck).
* Systems administration is _at the core_ of DevOps. It is the Ops and influences the Dev.
* Prior knowledge is useful, this stuff was designed in the 70s. */
