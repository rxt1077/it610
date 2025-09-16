#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [Users and Permissions],
)

#title-slide(
  title: [Users and Permissions],
)


#alternate(
  title: [Users],
  image: licensed-image(
    file: "/images/multics.jpg",
    license: "CC BY-NC-SA 2.0",
    title: [Multics badge],
    url: "https://www.flickr.com/photos/carrierdetect/2016868314",
    author: [Andrew Back],
    author-url: "https://www.flickr.com/photos/carrierdetect/"
  ),
  text: [
    - designed for multi-user, remember Multics?
    - users can be found in `/etc/passwd`
      - passwords used to be in `/etc/passwd`, now in `/etc/shadow`
  ],
)

#slide(
  title: [/etc/passwd Format],
  [
    #align(center, code(
      ```passwd
      root:x:0:0::/root:/bin/bash
      ryan:x:1000:998:Ryan:/home/ryan:/bin/bash
      nobody:x:65534:997::/nonexistent:/sbin/nologin
      ntpd:x:989:997:NTP daemon user:/var/empty:/sbin/nologin
      messagebus:x:987:982:D-Bus system bus user:/run/dbus:/sbin/nologin
      polkitd:x:986:981:Polkit daemon user:/var/empty:/sbin/nologin
      geoclue:x:985:979:GeoClue daemon user:/var/empty:/sbin/nologin
      colord:x:984:978:colord daemon user:/var/empty:/sbin/nologin
      avahi:x:983:977:Avahi daemon user:/var/empty:/sbin/nologin
      gdm:x:982:975:GNOME Display Manager user:/sbin/nologin
      sshd:x:988:983:sshd privilege separation user:/sbin/nologin
      ```
    ))
    - username, password hash, user id, group id, friendly name, shell
    - password hashes are actually in /etc/shadow
  ]
)

#alternate(
  title: [Groups],
  image: licensed-image(
    file: "/images/group.png",
    license: "PUBLIC",
    title: [Group Together Teamwork Free Photo],
    url: "https://www.needpix.com/photo/791933/group-together-teamwork-icon-free-vector-graphics",
  ),
  text: [
    - multiple users may need the same access
    - put those users in groups
    - groups can be found in `/etc/group`
    - users also have a primary group specified in `/etc/passwd`
  ],
)

#slide(
  title: [/etc/group Format], toolbox.side-by-side[
    #code(
      ```group
      root:x:0:
      wheel:x:999:ryan
      users:x:998:
      nogroup:x:997:
      tty:x:996:
      dialout:x:995:
      kmem:x:994:
      input:x:993:
      video:x:992:ryan,gdm
      audio:x:991:ryan
      netdev:x:990:ryan
      lp:x:989:
      tape:x:985:
      sgx:x:980:
      messagebus:x:982:
      polkitd:x:981:
      gdm:x:975:
      sshd:x:983:
      ```
    )][
      - group name, password hash, group id, members
      - group passwords are typically not used
    ]
)

#alternate(
  title: [Permissions],
  image: licensed-image(
    file: "/images/777.png",
    license: "FAIRUSE",
    title: [chmod 101],
    url: "https://www.reddit.com/r/linuxmemes/comments/k7rsts/chmod_101/",
    author: [byruit],
    author-url: "https://www.reddit.com/user/byruit/",
  ),
  text: [
    - every file/directory has permissions
    - specified in octal, can be shown with `ls -l`
  ],
)

#alternate(
  title:[UNIX Permissions],
  image: licensed-image(
    file: "/images/perms.jpg",
    license: "FAIRUSE",
    title: [Unix File Permissions],
    url: "https://medium.com/@omerorhan87/unix-file-permissions-a9372f3b1568",
    author: [Omer Orhan],
    author-url: "https://medium.com/@omerorhan87",
  ),
  text: [
    - chmod is a utility used to modify permissions
    - `chmod 666 /tmp/have-at-it.txt`
    - `chmod 644 /tmp/mine-but-you-can-read-it.txt`
    - `chmod 600 /tmp/mine-keep-out.txt` 
  ],
)

#slide(
  title: [useradd/userdel/usermod],
  [
    - editing `/etc/passwd`, `/etc/shadow`, and `/etc/group` can go poorly
    - these basic commands let you add, delete, and modify users from the command line
    - `useradd ryan -g users`: Add a user named ryan in the group users
    - `usermod ryan -a -G sudoers`: Add ryan to the sudoers group too
    - `userdel ryan`: Delete ryan
    - man pages: #link("https://linux.die.net/man/8/useradd")[useradd], #link("https://linux.die.net/man/8/usermod")[usermod], and #link("https://linux.die.net/man/8/userdel")[userdel]
    - these are _low-level_ commands and they may not handle things like home directories!
  ]
)

#slide(
  title: [chown/chmod],
  [
    - chmod was already covered
    - chown lets you change the owner _and_ group: `chown ryan:devs roadmap.py`
    - both of these have _recursive_ options
    - man pages: #link("https://linux.die.net/man/1/chown")[chown], #link("https://linux.die.net/man/1/chmod")[chmod]
    - WARNING: Users need to re-login to have their groups updated!
  ]
)

#alternate(
  title: [su/sudo],
  image: licensed-image(
    file: "/images/xkcd-sudo.png",
    license: "CC BY-NC 2.5",
    title: [Sandwich],
    url: "https://xkcd.com/149/", 
    author: [Randall Munroe],
    author-url: "https://xkcd.com/about",
  ),
  text: [
    - su lets you run a shell (or a command) as any user
    - su requires you to enter the root password
    - sudo lets you run commands typically as root
    - sudo requires you to enter your password and your username needs to be in the /etc/sudoers file or the `wheel/sudoers` group
  ]
)

#slide(
  title: [groups],
  [
    - shows you the groups you are in by default: `groups`
    - can also show you the groups someone else is in: `groups ryan`
    - #link("https://wiki.debian.org/SystemGroups")[Debian System Groups] 
  ]
)

#alternate(
  title: [UID, GID, subuid, and subgid],
  image: licensed-image(
    file: "/images/rootless.png",
    license: "FAIRUSE",
    title: [User and Group ID Translation],
    url: "https://docs.solace.com/Software-Broker/Container-Tasks/rootless-containers.htm"
  ),
  text: [
    - UID, user id, and GID, group id, are integers that represent a user and a group respectively
    - UID zero is for the root user
    - processes get the UID of the person who ran it
    - UIDs and GIDs are stored in the filesystem to manage access
    - `/etc/subuid` and `/etc/subgid` allows the superuser to give certain users a range of subordinate UID and GID mappings
    - this allows users to #link("https://lwn.net/Articles/532593/")[build namespaces with UNIX permissions] and #link("https://rootlesscontaine.rs/getting-started/common/subuid/")[run rootless containers]
  ],
)
