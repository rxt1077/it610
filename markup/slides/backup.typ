#import "/templates/slides.typ": *

#let title = [Backup]
#let outcomes = ("shell", "archive", "files", "create-volumes")

#show: university-theme.with(
  short-title: [Backup],
)

#title-slide(
  title: [Backup],
)

#alternate(
  title: [tar],
  image: licensed-image(
    file: "/images/data-cassettes.jpg",
    title: [3M data cassettes, paper and data archive, Computer History Museum, Montain View, California, USA],
    url: "https://commons.wikimedia.org/wiki/File:3M_data_cassettes,_paper_and_data_archive,_Computer_History_Museum,_Mountain_View,_California,_USA_%2849501289483%29.jpg",
    author: [Cory Doctorow],
    author-url: "https://www.flickr.com/people/37996580417@N01",
    license: "CC BY-SA 2.0",
  ),
  text: [
    - Tape Archive
    - Oldest format, think zip without compression
    - Often uses BSD style options `tar xvf`
    - Creating a tar file: `tar cvf files.tar .`
    - Extracting a tar file: `tar xvf files.tar`
    - Let's take a look
  ],
)

#alternate(
  title: [gzip/bzip2/xz],
  image: licensed-image(
    file: "/images/zip-file.svg",
    title: [Antu Folder-tar.svg],
    url: "https://commons.wikimedia.org/wiki/File:Antu_folder-tar.svg",
    author: [Fabián Alexis],
    author-url: "https://github.com/fabianalexisinostroza",
    license: "CC BY-SA 3.0",
    width: 75%,
  ),
  text: [
    - Often used to compress a tar file
    - Compression ratios xz > bzip2 > gzip
    - Do you really need compression?
    - Should you be compressing _where_ you are compressing?
  ],
)

#alternate(
  title: [scp],
  image: licensed-image(
    file: "/images/ssh.svg",
    title: [Unofficial SSH Logo],
    url: "https://commons.wikimedia.org/wiki/File:Unofficial_SSH_Logo.svg",
    author: [Jessie Kirk],
    author-url: "https://commons.wikimedia.org/wiki/User:TheJessieKirk",
    license: "CC BY 4.0",
  ),
  text: [
    - Transfer files to a remote more securely than FTP
    - Can use keys so that you don't have to enter a password
    - Can be _slow_ especially if you are repeating yourself
  ],
)

#alternate(
  title: [rsync],
  image: licensed-image(
    file: "/images/rsync.jpg",
    title: [rsync Logo],
    url: "https://rsync.samba.org",
    license: "FAIRUSE",
  ),
  text: [
    - Don't repeat yourself! (DRY)
    - If a file is already there and its hash is the same, don't re-upload it
    - Typically gets buried in a cronjob or a script so frankly I don't remember all of the options
    - #link("https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/")[Ten Practical Examples of rsync]
    - #link("https://github.com/google/cdc-file-transfer")[Interesting improvement: CDC]
  ],
)

#alternate(
  title: [Databases],
  image: licensed-image(
    file: "/images/database.svg",
    title: [Database-icon],
    url: "https://commons.wikimedia.org/wiki/File:Database-icon.svg",
    license: "CC BY-SA 4.0",
    author: [Zahra Ibrahem],
    author-url: "https://commons.wikimedia.org/w/index.php?title=User:Zahra_Ibrahem",
  ),
  text: [
    - Know where your database stores its persistent data (typically it's in the documentation on Docker Hub).
    - Some databases use small files, others use large. This can effect your backup strategy.
    - Some databases have built-in ways of performing backups (mysqldump)
  ],
)

#alternate(
  title: [Network Attached Storage],
  image: licensed-image(
    file: "/images/nas.svg",
    title: [Nas server],
    url: "https://commons.wikimedia.org/wiki/File:Nas_server.svg",
    license: "CC BY-SA 4.0",
    author: [Zahra Ibrahem],
    author-url: "https://commons.wikimedia.org/w/index.php?title=User:Zahra_Ibrahem",
  ),
  text: [
    - RAID is not a backup, I repeat RAID IS NOT A BACKUP!
    - Some NAS solutions have built-in backup options
    - Don't replicate work that has already been done by the vendor, since most backup needs are very similar there is typically already a built solution.
  ],
)

#alternate(
  title: [Container Volumes],
  image: licensed-image(
    file: "/images/docker-logo.svg",
    title: "Docker Logo",
    url: "https://www.svgrepo.com/svg/331370/docker",
    license: "CC0",
  ),
  text: [
    - Particularly hard to get to because they could be running in a virtual environment.
    - Typically we spin up a container with the volume mounted _just_ to handle a backup operation: `docker run -v myvol:/mnt -v "$(pwd):/output" ubuntu tar cf /output/files.tar /mnt`
    - On a Linux host, it's a little easier to get at the volumes, they may be part of your regular backup schedule.
    - You can also do it from the Docker Desktop GUI!
  ],
)
