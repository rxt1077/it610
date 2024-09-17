#import "themes/njit.typ": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

#show: university-theme.with(short-title: [Missing])

#title-slide(title: [What's missing?])

#focus-slide()[
  We've been learning in a virtualized environment.
  What haven't we had a chance to work with?
]

#let blob(pos, label, tint: white, ..args) = node(
  pos, align(center, label),
  fill: tint.lighten(60%),
  stroke: 1pt + tint.darken(20%),
  shape: rect,
  corner-radius: 5pt,
  ..args,
)

#slide(title: [The Boot Process])[
  #align(
    center + horizon,
    diagram(
      blob((0,0), [
        BIOS \
        \
        configuration \
        POST
      ], tint: red),
      edge("-|>"),
      blob((1, 0), [
        Bootloader \
        \
        GRUB, LILO, \
        SYSLINUX, PXE
      ], tint: orange),
      edge("-|>"),
      blob((2, 0), [
        Kernel \
        \
        via boot partition \
        or possibly network
      ], tint: yellow),
      edge((2, 0), (2, 0.5), (0, 0.5), (0, 1), "-|>"),
      blob((0, 1), [
        init \
        \
        systemd, runit, \
        SysVinit, upstart
      ], tint: green),
      edge("-|>"),
      blob((1, 1), [
        init scripts \
        \
        init system \
        dependent
      ], tint: blue),
      edge("-|>"),
      blob((2, 1), [
        daemons \
        \
        services, etc.
      ], tint: purple),
    )
  )
]

#slide(title: [Init System],
  side-by-side[
    #v(1fr)
    - PID 1
    - SysV was the old way of doing it
    - Most modern systems run sytemd (it's conentious)
    - The init system brings up and monitors daemon processes
    #v(1fr)
  ][
    #image("images/number_one.png")
  ]
)

#slide(title: [Basic systemctl Commands],
  side-by-side(columns: (30%, 70%))[
    #v(1fr)
    #image("images/systemd-light.svg")
    #v(1fr)
  ][
    #v(1fr)
    - `systemctl list-units --type=service`
    - `systemctl start <servicename>`
    - `systemctl stop <servicename>`
    - `systemctl restart <servicename>`
    - `systemctl enable <servicename>`
    #v(1fr)
  ]
)

#slide(title: [Processes],
  side-by-side[
    #v(1fr)
    - OS kernel allows for multiple things to run at once
    - A process is one of those things
    - The kernel scheduler splits time between them
    - #link("https://documentation.suse.com/sles/15-SP1/html/SLES-all/cha-tuning-taskscheduler.html")[This can be adjusted!]
    #v(1fr)
  ][
    #v(1fr)
    #image("images/ps.png")
    #v(1fr)
  ]
)

#slide(title: [Tuning the Process Scheduler],
  side-by-side(columns: (40%, 60%))[
    #v(1fr)
    #image(width: 100%, "images/process-states.png")
    #v(1fr)
  ][
    #v(1fr)
    - `/proc/sched_debug` shows all tunable variables
    - `sysctl` (not systemctl!) can be used to adjust them
    - `chrt` shows the real-time attributes of a running process
    - If you make changes, don't forget to make them permanent! (/etc/sysctl.conf)
    #v(1fr)
  ]
)

#slide(title: [Devices],
  side-by-side[
    #v(1fr)
    - Real systems have real devices
    - I/O is a pretty standard bottleneck in production systems
    - #link("https://cromwell-intl.com/open-source/performance-tuning/disks.html")[Sysfs allows for tuning of I/O devices]
    - I/O also has schedulers
    #v(1fr)
  ][
    #v(1fr)
    #image("images/linux-kernel-overview.png")
    #v(1fr)
  ]
)

#slide(title: [udev])[
  #v(1fr)
  - A list of rules that determines what to do/create when a device is added
  - Devices can have persistent names through devfs (can be very useful for USB)
  - Initialization can take place automatically
  #code(title: [/lib/udev/rules.d/80-usb.rules])[
    ```udev
      KERNEL=="sd*", SUBSYSTEMS=="scsi", ATTRS{model}=="USB 2.0 Storage Device", SYMLINK+="usbhd%n"
    ```
  ]
  #v(1fr)
]

#slide(title: [General Advice for Tuning Linux],
  side-by-side(columns: (35%, 1fr))[
    #v(1fr)
    #image("images/advice.png", width: 100%)
    #v(1fr)
  ][
    #v(1fr)
    - Determine your metric in advance!
    - Take slow steps and monitor changes
    - Be prepared to walk-back changes
    #v(1fr)
  ]
)
