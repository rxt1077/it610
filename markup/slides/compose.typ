#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import fletcher.shapes: parallelogram
#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [Compose],
)

#title-slide(
  title: [Docker Compose],
)

#alternate(
  title: [Goals],
  image: licensed-image(
    file: "/images/compose.png",
    license: "FAIRUSE",
    title: [Docker Compose logo],
    url: "https://codeblog.dotsandbrackets.com/quick-intro-to-docker-compose/compose-logo/",
  ),
  text: [
    - Run multiple containers
    - Have containers communicate with each other
    - Easily to bring a whole system up and down
  ],
)

#alternate(
  title: [The Good],
  image: licensed-image(
    file: "/images/thumbs-up.jpg",
    license: "CC BY 2.0",
    title: [thumbs up],
    url: "https://live.staticflickr.com/2426/3958637561_c266717b95_o_d.jpg",
    author: [anthony kelly],
    author-url: "https://www.flickr.com/photos/62337512@N00/",
  ),
  text: [ 
    - Already included with Docker Desktop
    - Easy to run
    - Can be used on dev machines
  ],
)

#alternate(
  title: [The Bad],
  image: licensed-image(
    file: "/images/thumbs-down.jpg",
    license: "CC BY-NC-SA 2.0",
    title: [2 thumbs down],
    url: "https://www.flickr.com/photos/88494026@N00/2516298393",
    author: [sparklemotion0],
    author-url: "https://www.flickr.com/photos/88494026@N00",
  ),
  text: [
    - Strange persistence choices
    - Difficult to run on multiple machines
    - Not considered production stable
    - Path name issues
  ],
)

#slide(title: [Setup])[
  #align(center,
    text(20pt,
      diagram(
          spacing: 15pt,
          node-fill: gradient.radial(white, blue, radius: 200%),
          node-stroke: blue,
          (
            node((2,0), [Project Root],
              shape: parallelogram.with(angle: 20deg),
              fill: gradient.radial(white, green, radius: 200%)),
            edge((1,1), "-"),
            edge((2,1), "-"),
            edge((3,1), "-"),
            edge((5,1), "-"),
            node((1,1), [docker-compose.yml], shape: rect),
            node((2,1), [.env], shape: rect),
            node((3,1), [web],
              shape: parallelogram.with(angle: 20deg),
              fill: gradient.radial(white, green, radius: 200%)),
            edge((2.5,2), "-"),
            edge((3.75,2), "-"),
            node((2.5,2), [Dockerfile]),
            node((3.75,2), [httpd.conf]),
            node((5,1), [db],
              shape: parallelogram.with(angle: 20deg),
              fill: gradient.radial(white, green, radius: 200%)),
            edge("-"),
            node((5, 2), [Dockerfile])
          )
      )
    )
  )
  \
  - `docker-compose.yml` in the root of the project
  - `.env` file will be loaded, environment variables can be used
  - directories are used for individual parts of system 
]


#focus-slide()[
  What goes in the docker-compose.yml?
]

#matrix-slide(columns: 3, rows: 2,
  [*version* \ 
  info only, not required or recommended],
  [*services* \
  containers that will be run, with options],
  [*networks* \
  individual networks to be created, if omitted one network linking all services will be created],
  [*volumes* \
  persistent data stores],
  [*configs* \
  volumes for config files],
  [*secrets* \
  configs for sensitive data]
)

#slide(title: [Services])[
  - largest part of a docker-compose.yml file
  - most options in the compose file spec
  - services can be resolved by their name internally
]

#slide(title: link("https://github.com/docker/awesome-compose/blob/master/pihole-cloudflared-DoH/compose.yaml")[Service Example], [
#set text(10pt)
```yaml
pihole:
  container_name: pihole
  image: pihole/pihole:latest
  ports:
    - "53:53/tcp"
    - "53:53/udp"
    - "67:67/udp"
    - "8080:80/tcp"
    - "8443:443/tcp"
  environment:
    - TZ=${TIMEZONE}
    - PIHOLE_DNS_=172.20.0.2#5054;1.1.1.1 # referencing by name results in "Invalid IP detected in PIHOLE_DNS_: cloudflared#5054"
    - WEBPASSWORD=${PIHOLE_PW}
    - REV_SERVER=true
    - REV_SERVER_TARGET=${PIHOLE_ROUTER_IP}
    - REV_SERVER_DOMAIN=${PIHOLE_NETWORK_DOMAIN}
    - REV_SERVER_CIDR=${PIHOLE_REVERSE_DNS}
    - ServerIP=${PIHOLE_HOST_IP}
    - ServerIPv6=${PIHOLE_HOST_IPV6}
  #dns:
    #- 127.0.0.1 # "Sets your container's resolve settings to localhost so it can resolve DHCP hostnames [...]" - github.com/pi-hole/docker-pi-hole
    #- 1.1.1.1 # Backup server
  volumes: # store your data between container upgrades
    - "/etc/pihole/:/etc/pihole/"
    - "/etc/dnsmasq.d/:/etc/dnsmasq.d/"
  cap_add:
    - NET_ADMIN # Recommended but not required (DHCP needs NET_ADMIN) https://github.com/pi-hole/docker-pi-hole#note-on-capabilities
  depends_on:
    - "cloudflared"
  restart: always
  networks:
    - dns-net
```
])

#slide(title: [Running])[
  - similar options to `docker` command but with a few things fixed
  - `docker-compose.yml` expected to be in the direction where you are running `docker compose`
  - `docker compose up` brings everything up in the foreground
  - `docker compose down` (Ctrl-C if running) brings things down (gracefully, hopefully)
  - `docker compose build` builds all custom Docker images, don't forget!
  - `docker compose exec <service>` run something on a running service
  - `docker compose run <service>` run a running container
]

#slide(title: [Resources])[
  #align(center, 
    licensed-image(
      file: "/images/compose-diagram.svg",
      license: "CC BY-NC 4.0",
      title: [compose-diagram.svg],
      url: "https://rxt1077.github.io/it610/docs/images/compose-diagram.svg",
      author: [Ryan Tolboom],
      author-url: "https://using.tech",
      width: 75%,
    )
  )
  \
  - #link("https://docs.docker.com/compose/compose-file/)")[Full Compose File Spec]
  - #link("https://docs.docker.com/compose/reference/")[Docker Compose CLI reference]
  - #link("https://github.com/docker/awesome-compose/")[Awesome Compose (curated list of cool Docker Compose examples)]
]
