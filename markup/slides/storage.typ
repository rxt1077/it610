#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [Storage],
)

#title-slide(
  title: [Storage],
)

#alternate(
  title: [Mounting in \*nix],
  image: licensed-image(
    file: "/images/screams-in-dos.png", 
    title: [at least mac is \*nix],
    url: "https://www.reddit.com/r/linuxmasterrace/comments/h0fsg9/at_least_mac_is_nix/",
    author: [meme-peasant],
    author-url: "https://www.reddit.com/user/meme-peasant/",
    license: "FAIRUSE",
  ),
  text: [
    - All sorts of things can be mounted at points in the file system
    - Checkout the output of the mount command
    - df shows disk usage for currently mounted things
    - /etc/fstab shows you what things are typically mounted at boot
    - Things can be mounted on top of one another!
    - Block devices are typically mounted in /mnt or /media
    - Docker will bind mount directories or mount volumes INTO your containers
  ],
)

#alternate(
  title: [Filesystems],
  image: licensed-image(
    file: "/images/fuse.svg",
    title: [FUSE structure],
    url: "https://commons.wikimedia.org/wiki/File:FUSE_structure.svg",
    author: [User:Sven],
    author-url: "https://commons.wikimedia.org/wiki/User:Sven",
    license: "CC BY-SA 3.0",
  ),
  text: [
    - Kernel modules can be loaded to support file systems
    - FUSE - file systems can also be setup in userspace
    - What is currently supported? (cat /proc/filesystems)
    - We often think of filesystems on block devices
    - lsblk will show you your block devices
    - fdisk (or cfdisk) can be used to see the partition scheme of a disk
      - /dev/sda is the disk
      - /dev/sda1 is the partition
      - /dev/sdb is the NEXT disk
      - YES YOU CAN DESTROY EVERYTHING
  ],
)

#alternate(
  title: [Logical Volume Manager],
  image: licensed-image(
    file: "/images/lvm.svg",
    title: [Lvm],
    url: "https://commons.wikimedia.org/wiki/File:Lvm.svg",
    author: [Emanuel Duss],
    author-url: "https://emanuelduss.ch/",
    license: "CC BY-SA 3.0",
  ),
  text: [
    - Modern Linux systems utilize the Logical Volume Manager
    - More flexible than traditional partitioning
    - Allows for snapshots, encryption, and resizing
  ],
)


#let my-node(position, label, tint) = {
  node(
    position,
    label,
    shape: rect,
    stroke: 1pt + tint.darken(20%),
    fill: tint.lighten(60%),
    corner-radius: 5pt,
    width: 12em,
  )
}

#slide(title: [Filesystems in Docker], toolbox.side-by-side(align(horizon)[
  - Docker uses an overlay fs (implementation differs depending on underlying OS)
  - The filesystem a container sees is the thin, top-most layer
  - Copy-on-Write (COW) means layers can be shared and copies are only made when needed
],align(horizon+center)[
  #diagram(
    spacing: (1em, 1.5em),
    my-node((0,0), [Layer 3 - My Code], red),
    my-node((0,1), [Layer 2 - Rust Packages], red),
    my-node((0,2), [Layer 1 - Ubuntu], red),
    my-node((0,3), [overlay2 storage driver], orange),
    my-node((0,4), [Linux on WSL2], yellow),
    my-node((0,5), [Host OS (Windows)], green),
    edge((0,0), (0,1), "<|-|>"),
    edge((0,1), (0,2), "<|-|>"),
    edge((0,2), (0,3), "<|-|>"),
    edge((0,3), (0,4), "<|-|>"),
    edge((0,4), (0,5), "<|-|>"),
  )
]))

#slide(title: [Common Filesystems by OS], toolbox.side-by-side()[
  == DOS
  - FAT12
  - FAT16
  - FAT32
  - VFAT (widely supported)
  == Windows
  - NTFS
  - ReFS
][
  == Linux
  - ext2
  - ReiserFS
  - ext3
  - ext4
  - btrfs
  - zfs
][
  == Key Features
  - scalability
  - cryptography
  - resilience (CoW, atomic transactions)
  - replication
])

#alternate(
  title: [Network File Systems],
  image: licensed-image(
    file: "/images/server-rack.jpg",
    title: [half filled server racks],
    url: "https://commons.wikimedia.org/wiki/File:Half_filled_server_racks.jpg",
    author: [Alexis Lê-Quôc],
    author-url: "https://www.flickr.com/photos/42139601@N00",
    license: "CC BY-SA 2.0",
  ),
  text: [
    - SMB
    - NFS
    - AFS (you should know this one)
    - Usually a daemon but can be implemented in the kernel or via FUSE

    == Common Problems
    - keeping things in sync
    - permissions
    - minimizing bandwidth usage
    - caching
  ]
)

#alternate(
  title: [RAID],
  image: licensed-image(
    file: "/images/raid5.svg",
    title: [RAID_5],
    url: "https://en.wikipedia.org/wiki/Standard_RAID_levels#/media/File:RAID_5.svg",
    author: [Cburnett],
    author-url: "https://en.wikipedia.org/wiki/User:Cburnett",
    license: "CC BY-SA 3.0",
  ),
  text: [
    == Redundant Array of Inexpensive/Independent Disks
    - RAID 0: Striping for speed, make sure your controller can handle the bps
    - RAID 1: Redundancy for high availability. Make sure your controller can handle hot-swapping
    - RAID 5: Striping AND redundancy. Minimum three disks. A SINGLE lost disk can be recovered from but it takes a while to rebuild the array.
    - RAID 1 + 0: Combination of RAID 0 and 1 for speed AND redundancy. More resilient than RAID 5 but less efficient usage of space.
  ]
)

#alternate(
  title: [Questions for Discussion],
  image: licensed-image(
    file: "/images/question.jpg",
    title: [Question Mark on Chalk Board],
    url: "https://www.pexels.com/photo/question-mark-on-chalk-board-356079/",
    license: "CC0",
  ),
  text: [
    - What’s the difference between a file system and a database?
    - Are certain file systems better for databases?
    - Why do you need to know about networked file systems when using containers?
    - Why does Docker use different overlay solutions for different underlying filesystems?
  ],
)

#slide(title: [Resources])[
  - #link("https://www.ufsexplorer.com/articles/file-systems-basics.php")[Understanding file systems]
  - #link("https://docs.microsoft.com/en-us/windows-server/storage/refs/refs-overview")[Resilient File System (ReFS) overview]
  - #link("https://www.freebsd.org/doc/handbook/zfs.html")[FreeBSD Handbook: Chapter 19. The Z File System (ZFS)]
  - #link("https://en.wikipedia.org/wiki/Category:Network_file_systems")[Wikipedia List of Network File Systems]
  - #link("http://www.raid-calculator.com/")[RAID Calculator]
]
