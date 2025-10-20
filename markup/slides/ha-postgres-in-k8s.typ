#import "/templates/slides.typ": *

#let title = [High-Availability Postgres in Kubernetes]
#let outcomes = ("shell", "text", "files", "manage-containers",
                 "create-images", "orchestration", "custom-deployment")

#show: university-theme.with(
  short-title: [HA Postgres in K8s],
)

#title-slide(
  title: title
)

#alternate(
  title: [Goals],
  image: licensed-image(
    file: "/images/target.svg",
    license: "PUBLIC",
    url: "https://freesvg.org/arrow-in-a-target",
    title: [Arrow in a target],
  ),
  text: [
    - implement a primary / standby replication setup for PostgreSQL
    - two _Services_ will be provided: read/write and read
    - Kubernetes will handle the initialization and monitoring
    - we will be using YAML files to pass objects to `kubectl apply`
  ],
)

#alternate(
  title: [_PersistentVolumeClaim_],
  image: licensed-image(
    file: "/images/pvc.svg",
    license: "CC BY 4.0",
    title: [Labeled PVC],
    url: "https://github.com/kubernetes/community/tree/master/icons/svg/resources/labeled/pvc.svg",
    author: [Etienne Coutaud],
    author-url: "https://github.com/etiennecoutaud",
    width: 75%,
  ),
  text: [
    - lets the cluster know that you are expecting certain storage resources
    - we are looking for a place to store our primary database files
    - claims are fulfilled by a StorageClass that is built-in (#link("https://platform9.com/blog/tutorial-dynamic-provisioning-of-persistent-storage-in-kubernetes-with-minikube")[details])
  ],
)

#alternate(
  title: [_PersistentVolumeClaim_ Example],
  image: licensed-image(
    file: "/images/pvc.svg",
    license: "CC BY 4.0",
    title: [Labeled PVC],
    url: "https://github.com/kubernetes/community/tree/master/icons/svg/resources/labeled/pvc.svg",
    author: [Etienne Coutaud],
    author-url: "https://github.com/etiennecoutaud",
    width: 75%,
  ),
  text: [
    #code([
      ```yml
      ---
      apiVersion: v1
      kind: PersistentVolumeClaim
      metadata:
        name: db-primary-pv-claim
      spec:
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 512M
      ----
      ```
    ])
  ]
)

#alternate(
  title: [Supported accessModes],
  image: licensed-image(
    file: "/images/locks-and-keys.png",
    license: "CC BY 4.0",
    title: [Locks and Keys],
    url: "https://vectorportal.com/vector/locks-and-keys/34917",
    author: [Vectorportal.com],
    author-url: "https://vectorportal.com",
  ),
  text: [
    This claim will be used by our one db-rw pod, so we don’t have to worry about shared access.
    The supported accessModes are:

    - ReadWriteOnce - can be mounted read / write by only one pod
    - ReadOnlyMany - can be mounted read-only by many pods
    - ReadWriteMany - can be mounted as read-write by many pods
  ],
)

#alternate(
  title: [_Service_],
  image: licensed-image(
    file: "/images/svc.svg",
    license: "CC BY 4.0",
    title: [Labeled Service],
    url: "https://github.com/kubernetes/community/tree/master/icons/svg/resources/labeled/svc.svg",
    author: [Etienne Coutaud],
    author-url: "https://github.com/etiennecoutaud",
    width: 75%,
  ),
  text: [
    - exposes an application on a group of pods
    - two _Services_
      - db-rw Service which connects to our primary PostgreSQL instance
      - db-r Service which connects to our standby PostgreSQL instances
    - Unlike Docker Compose, even on our internal network we have to explicitly state which ports we make available
  ],
)

#slide(title: [_Service_ Example])[
  #set align(center + horizon)
  #toolbox.side-by-side(
    code([
      ```yml
      ---
      apiVersion: v1
      kind: Service
      metadata:
        name: db-rw
        labels:
          app: db-rw
        spec:
          selector:
            app: db-rw
          ports:
            - protocol: TCP
              port: 5432
      ```
    ], title: [Read / Write], text-size: 0.8em),
    code([
      ```yml
      ---
      apiVersion: v1
      kind: Service
      metadata:
        name: db-r
        labels:
          app: db-r
      spec:
        selector:
          app: db-r
        ports:
          - protocol: TCP
            port: 5432
      ```
    ], title: [Read Only], text-size: 0.8em),
  )
]

#slide(title: [Selectors])[
  - the selector field above defines how a _Service_ knows which pods to utilize
  - all pods with the app label db-r are used by the db-r
  - a similar rule is applied to the db-rw _Service_
  - both services accept incoming connections on port 5432 and route those connections to 5432
  - if there are multiple pods in a _Service_ a load balancing scheme is used by default
]

#alternate(
  title: [Service Discovery],
  image: licensed-image(
    file: "/images/radar.svg",
    title: [Radar screen vector image],
    url: "https://freesvg.org/radar-screen-vector-image",
    license: "PUBLIC",
    author: [OpenClipart],
    width: 75%
  ),
  text: [
    - Kubernetes _Services_ make things easier
    - You want to connect to a read-only database instance? Use the hostname db-r
    - You want to connect to a read-write database instance? use the hostname db-rw
    - DNS resolution, load-balancing, and routing are set up automatically
  ],
)

#alternate(
  title: [_Deployment_],
  image: licensed-image(
    file: "/images/deploy.svg",
    license: "CC BY 4.0",
    title: [Labeled Deploy],
    url: "https://github.com/kubernetes/community/tree/master/icons/svg/resources/labeled/deploy.svg",
    author: [Etienne Coutaud],
    author-url: "https://github.com/etiennecoutaud",
    width: 75%,
  ),
  text: [
    - tells Kubernetes how to create and monitor pods
    - the bulk of our work will be done in the db-r and db-rw _Deployment_
    - let's take a look at them on #link("https://github.com/rxt1077/it610/tree/master/exercises/db-k8s")[GitHub]
  ],
)
