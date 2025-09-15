#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [Cloud]
)

#title-slide(
  title: [Cloud Computing]
)

#alternate(
  title: [What is it?],
  image: licensed-image(
    file: "/images/cloud.svg",
    license: "CC BY-SA 4.0",
    title: [FSFE There is no cloud postcard en.svg],
    url: "https://upload.wikimedia.org/wikipedia/commons/f/f5/FSFE_There_is_no_cloud_postcard_en.svg",
    author: [Markus Meier, FSFE],
    author-url: "https://fsfe.org/contribute/spreadtheword.html#nocloud",
  ),
  text: [
    - A silly catchphrase with a disheartening origin
    - Technically it can be IaaS, SaaS, PaaS
    - Is it new?
    - Why virtualize? Why not just rent servers?
  ],
)

#focus-slide([What's good about it?])

#matrix-slide(columns: 3, rows: 2,
  [Redundancy], [Scalability], [Co-Location],
  [Lower Bandwidth Costs], [Lower Building Costs], [Lower Staffing Costs]
)

#focus-slide([What's bad about it?])

#matrix-slide(columns: 1, rows: 3,
  [Recurring Costs],
  [Loss of Physical Control],
  [Security Concerns]
)

#slide(
  title: [How does it work?], [
  \
  #toolbox.side-by-side[
    *Virtual Machines* \
    \
    - VirtualBox, QEMU, VMware, #link("https://aws.amazon.com/ec2/nitro/")[AWS Nitro], etc.
    - What are they?
    - How do they work?
    - Why use them?
  ][
    *Containers* \
    \
    - Docker, etc.
    - What are they?
    - How do they work?
    - Why use them?
  ]]
)

#slide(
  title: [Who does it?],
  toolbox.side-by-side[
    #v(1fr)
    - #link("https://aws.amazon.com")[Amazon Web Services]
    - #link("https://azure.microsoft.com/en-us")[Microsoft Azure]
    - #link("https://cloud.google.com/products/compute")[Google Compute Engine]
    - Most PaaS and SaaS runs on one of these
    #v(1fr)
  ][
    #v(1fr)
    #grid(
      columns: (1fr, 1fr),
      rows: (1fr, 1fr),
      gutter: 20pt,
      align(horizon, image("/images/aws.svg", width: 100%)),
      align(horizon, image("/images/azure.svg", width: 100%)),
      grid.cell(
        colspan: 2,
        align(center)[
          #image("/images/gce.svg", height: 90%)
          #text(size: 8pt, [AWS, Azure, and GCE logos are used under fair use])
        ]
      )
    )
    #v(1fr)
  ]
)

#alternate(
  title: [Want to try it at home?],
  image: licensed-image(
    file: "/images/messy-servers.jpg",
    license: "CC BY 2.0",
    title: [servers],
    url: "https://www.flickr.com/photos/40987321@N02/5580348753",
    author: [hisperati],
    author-url: "https://www.flickr.com/photos/40987321@N02",
  ),
  text: [
    - #link("https://www.reddit.com/r/homelab/")[/r/homelab]
    - Server hardware is #link("https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313.TR0.TRC0.A0.H0.Xr710.TRS5&_nkw=r710&_sacat=0")[CHEAP] (data centers refresh often)
    - Virtualization Platforms
      - #link("https://www.proxmox.com/en/")[Proxmox]
      - #link("https://www.vmware.com/products/cloud-infrastructure/esxi-and-esx")[ESXi]
      - #link("https://www.xenserver.com/")[XenServer]
    - You will learn a lot
    - You may also scare your family members and pets with loud noises and heavy computers!
    - What is in the "bare metal" of a virtualization server?
      Memory and processor cores.
      The more the merrier.
  ],
)

#alternate(
  title: [What can AWS do for you?],
  image: licensed-image(
    file: "/images/aws-funny.png",
    license: "FAIRUSE",
    title: [AWS in a Nutshell],
    url: "https://www.reddit.com/r/ProgrammerHumor/comments/9ym7mj/aws_in_a_nutshell/",
  ),
  text: [
    - Network architecture as code (subnets, VPCs, internet gateways, NAT gateways, load balancers, etc).
    - Tons of services: S3 storage, RDS database, ECS containers, EC2 compute, IAM identity and access...
    - Deploy _quickly_
    - Scale _quickly_
    - Unique products: spot instances, AMI sharing, mechanical turk #emoji.face
  ]
)

#alternate(
  title: [How do you deploy to AWS?],
  image: licensed-image(
    file: "/images/aws-funny2.jpg",
    license: "FAIRUSE",
    title: [Using AWS],
    url: "https://www.reddit.com/r/ProgrammerHumor/comments/w4eo12/using_aws/",
  ),
  text: [
    From least favorite to most favorite: \
    \
    + AWS Web Console / Instance Management
    + AWS Command Line and scripts
    + AWS Command Line and Ansible/Vagrant
    + #link("https://www.terraform.io/")[Terraform] and Provisioning Scripts
    + Terraform and Ansible
    \
    #link("https://thenewstack.io/hashicorp-abandons-open-source-for-business-source-license/")[Terraform licensing issue?]
  ],
)
