#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [Automation],
)

#title-slide(
  title: [Automate the Boring Stuff],
)

#alternate(
  title: [Python],
  image: licensed-image(
    file: "/images/python-logo.svg",
    license: "fairuse",
    title: [Python SVG Vector],
    url: "https://www.svgrepo.com/svg/376344/python",
  ),
  text: [
    - Huge library base
    - Easy to get started
    - Binaries for everything
    - Easy(ish) to maintain
    - #link("https://github.com/rxt1077/it610/blob/master/markup/typst_make.py")[These slides are automated with Python]
    - “I’m not really a coder”
  ],
)

#alternate(
  title: [BASH Scripts],
  image: licensed-image(
    file: "/images/bash-logo.svg",
    license: "fairuse",
    title: [full_color_dark.svg],
    url: "https://bashlogo.com/img/logo/svg/full_colored_dark.svg",
  ),
  text: [
    - They get the job done
    - If you can type on the command line, you can understand it
    - Consider migrating if they get huge
    - Any Linux system has a BASH interpreter
    - #link("https://medium.com/@viswa08/bash-script-weird-syntaxes-61b585ff1fb7")[Syntax can be pretty wonky]
  ],
)

#alternate(
  title: [Cron / At],
  image: licensed-image(
    file: "/images/crontab.png",
    license: "CC BY 2.0",
    title: [Cron Job],
    url: "https://www.flickr.com/photos/91795203@N02/16199272841",
    author: [xmodulo],
    author-url: "https://www.flickr.com/photos/91795203@N02",
  ),
  text: [
    - at - run once _at_ a later time
    - cron - run repeatedly according to a schedule
    - Every user (even root) can have a crontab that runs with their permissions
    - man cron, crontab -e
    - You better hope the cron daemon keeps running
    - If your container has a cronjob, you're doing it wrong
  ]
)

#alternate(
  title: [Push vs. Pull],
  image: licensed-image(
    file: "/images/push-pull.jpg",
    license: "CC BY 2.0",
    title: [Push and Pull Humour],
    url: "https://www.flickr.com/photos/89165847@N00/49319453518",
    author: [mikecogh],
    author-url: "https://www.flickr.com/photos/89165847@N00",
  ),
  text: [
    - Hybrid solutions are probably best (pull, but push when needed)
    - Some automation systems periodically check in (Puppet, Chef)
    - #link("https://clusterlabs.org")[High availability software] can be used to check system status
  ]
)

#focus-slide()[What should I automate?]

#matrix-slide(columns: 3, rows: 3,
  [Provisioning],
  [Deployment (git)],
  [Backups (rsync)],
  [Configuration],
  [Security],
  [Orchestration],
  [User notification],
  [Testing],
  [Coffee?],
)

#alternate(
  title: [Ansible],
  image: licensed-image(
    file: "/images/ansible-logo.svg",
    license: "fairuse",
    title: [Ansible logo.svg],
    url: "https://upload.wikimedia.org/wikipedia/commons/2/24/Ansible_logo.svg",
  ),
  text: [
    - Python-based, uses SSH
    - Push (can also do pull)
    - YAML (watch your spaces)
    - Playbooks
    - Roles
    - Lots of Modules
    - Descriptive: Define what you want to end up with
    - Cloud-ready
    - "I don't need Ansible, I'll just put all that in the Dockerfile"
  ],
)

#alternate(
  title: [Automation Mindset],
  image: licensed-image(
    file: "/images/mindset.jpg",
    license: "CC BY 2.0",
    title: [Mindset],
    url: "https://www.flickr.com/photos/128573122@N05/18658685910",
    author: [davis.steve32],
    author-url: "https://www.flickr.com/photos/128573122@N05",
  ),
  text: [
    - Change the way you think, tools will always change
    - What do I spend my time doing?
    - What provides the best experience for your users?
    - Can I automate and monetize something that others are doing by hand?
    - #link("https://en.wikipedia.org/wiki/Microsoft_System_Center_Configuration_Manager")[Windows Options]
  ]
)
