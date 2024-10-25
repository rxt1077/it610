#import "/templates/slides.typ": *

#show: university-theme.with(short-title: [Kubernetes])

#title-slide(title: [Kubernetes])

#alternate(
  title: [Local K8s Cluster Options],
  image: licensed-image(
    file: "/images/k8s.svg",
    license: "CC BY 4.0",
    title: [Kubernetes logo without workmark.svg],
    url: "https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg", 
    author: [Google, Inc],
    author-url: "https://www.google.com",
  ),
  text: [
    - #link("https://www.docker.com/products/docker-desktop")[Docker Desktop] - Supports running a single-machine Kubernetes instance. Edit settings from the task-bar icon.
    - #link("https://kubernetes.io/docs/tasks/tools/install-minikube/")[minikube] - Single-machine solution for developing on / testing Kubernetes.
    - #link("https://k3s.io/")[k3s] - Lightweight Kubernetes that can run on embedded devices. Great for k8s on an Raspberry Pi.
    - #link("https://kubernetes.io/docs/setup/learning-environment/kind/")[Kind] - Runs Kubernetes inside a Docker container.
  ]
)

#alternate(
  title: [Kubectl],
  image: [
    #set text(size: 80pt, font: "DejaVu Sans Mono")
    #rect(width: 350pt, height: 80pt, radius: 5pt, fill: rgb("#326ce5"))[
      #place(dx: 0pt, dy: 0pt, text(fill: white.darken(66%), [kubectl]))
      #place(dx: 3pt, dy: 3pt, text(fill: white.darken(33%), [kubectl]))
      #place(dx: 6pt, dy: 6pt, text(fill: white, [kubectl]))
    ]
  ],
  text: [
    - The most common CLI to a Kubernetes cluster
    - Can switch between contexts (different clusters)
    - Can apply objects, read logs, get status, etc.
    - Most things build off of these commands or at least reference them.
  ]
)

#slide(title: [Kubectl Example])[
  #code(
    ```console
    $ kubectl cluster-info
    Kubernetes master is running at https://kubernetes.docker.internal:6443
    KubeDNS is running at https://kubernetes.docker.internal:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

    To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

    $ kubectl config view
    apiVersion: v1
    clusters:
    - cluster:
        certificate-authority-data: DATA+OMITTED
        server: https://kubernetes.docker.internal:6443
      name: docker-desktop
    - cluster:
        certificate-authority: C:\Users\rxt1077\.minikube\ca.crt
        server: https://192.168.18.66:8443
      name: minikube
    contexts:
    - context:
    <snip>
  ```
  )
]

#alternate(
  title: [Pods],
  image: licensed-image(
    file: "/images/pod.svg",
    license: "CC BY 4.0",
    title: [Labeled Pod],
    url: "https://github.com/kubernetes/community/blob/master/icons/svg/resources/labeled/pod.svg",
    author: [Etienne Coutaud],
    author-url: "https://github.com/etiennecoutaud",
  ),
  text: [
    - A pod is the minimum unit of compute in Kubernetes. It typically runs a single
      container.
    - `kubectl get pod` is a good starting point when troubleshooting
    - `kubectl describe <pod-name>` will give you even more info
  ]
)

#slide(title: [Pod Example])[
  #code(
    ```console
  $ kubectl get pod
  NAME                          READY   STATUS    RESTARTS   AGE
  hello-node-7dc7987866-xnbxz   1/1     Running   0          22s

  $ kubectl describe pod hello-node-7dc7987866-xnbxz
  Name:         hello-node-7dc7987866-xnbxz
  Namespace:    default
  Priority:     0
  Node:         docker-desktop/192.168.65.3
  Start Time:   Thu, 09 Jul 2020 16:22:31 -0400
  Labels:       app=hello-node
                pod-template-hash=7dc7987866
  Annotations:  <none>
  Status:       Running
  IP:           10.1.0.7
  IPs:
    IP:           10.1.0.7
  Controlled By:  ReplicaSet/hello-node-7dc7987866
  Containers:
    echoserver:
  <snip>
  ```
  )
]

#alternate(
  title: [ReplicaSets],
  image: licensed-image(
    file: "/images/rs.svg",
    license: "CC BY 4.0",
    title: [Labeled ReplicaSet],
    url: "https://github.com/kubernetes/community/blob/master/icons/svg/resources/labeled/rs.svg",
    author: [Etienne Coutaud],
    author-url: "https://github.com/etiennecoutaud",
  ),
  text: [
    - A ReplicaSet is a grouping of pods that Kubernetes attempts to keep running
    - Kubernetes can detect failure (configurable) and restart a pod
    - Kubernetes will back-off if something keeps failing
  ]
)

#slide(title: [ReplicaSet Example], code(
  ```console
  $ kubectl get replicasets
  NAME                    DESIRED   CURRENT   READY   AGE
  hello-node-7dc7987866   1         1         1       4m4s

  $ kubectl describe replicaset hello-node-7dc7987866
  Name:           hello-node-7dc7987866
  Namespace:      default
  Selector:       app=hello-node,pod-template-hash=7dc7987866
  Labels:         app=hello-node
                  pod-template-hash=7dc7987866
  Annotations:    deployment.kubernetes.io/desired-replicas: 1
                  deployment.kubernetes.io/max-replicas: 2
                  deployment.kubernetes.io/revision: 1
  Controlled By:  Deployment/hello-node
  Replicas:       1 current / 1 desired
  Pods Status:    1 Running / 0 Waiting / 0 Succeeded / 0 Failed
  Pod Template:
    Labels:  app=hello-node
             pod-template-hash=7dc7987866
    Containers:
  <snip>
  ```
))

#alternate(
  title: [Deployments],
  image: licensed-image(
    file: "/images/deploy.svg",
    license: "CC BY 4.0",
    title: [Labeled Deployment],
    url: "https://github.com/kubernetes/community/blob/master/icons/svg/resources/labeled/deploy.svg",
    author: [Etienne Coutaud],
    author-url: "https://github.com/etiennecoutaud",
  ),
  text: [
    - A Deployment creates ReplicaSets to support the _deployment_ of an app
    - Deployments also support update strategies
  ]
)

#slide(title: [Deployment Example], code(
  ```console
  $ kubectl get deployments
  NAME         READY   UP-TO-DATE   AVAILABLE   AGE
  hello-node   1/1     1            1           7m18s

  $ kubectl describe deployment hello-node
  Name:                   hello-node
  Namespace:              default
  CreationTimestamp:      Thu, 09 Jul 2020 16:22:31 -0400
  Labels:                 app=hello-node
  Annotations:            deployment.kubernetes.io/revision: 1
  Selector:               app=hello-node
  Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
  StrategyType:           RollingUpdate
  MinReadySeconds:        0
  RollingUpdateStrategy:  25% max unavailable, 25% max surge
  Pod Template:
    Labels:  app=hello-node
    Containers:
     echoserver:
      Image:        k8s.gcr.io/echoserver:1.4
  <snip>
  ```
))

#alternate(
  title: [Working with YAML objects],
  image: licensed-image(
    file: "/images/yaml-logo.svg",
    license: "CC BY-SA 4.0",
    title: [Official YAML Logo],
    url: "https://upload.wikimedia.org/wikipedia/commons/5/5a/Official_YAML_Logo.svg",
    author: [Ingy döt Net],
    author-url: "http://ingy.net/"
  ),
  text: [
    - Define your objects in YAML files instead of just via the command line.
    - `kubectl apply -f <file>` will apply your file to make the cluster provide the
      resources you specified.
    - Similar to ansible, this is _descriptive_: if you want three replicas and you already have two, it'll just make the third.
  ]
)

#alternate(
  title: [YAML Deployment Example],
  image: code(
    ```yml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nginx-deployment
      labels:
        app: nginx
    spec:
        replicas: 3
        selector:
          matchLabels:
            app: nginx
        template:
          metadata:
            labels:
              app: nginx
          spec:
            containers:
            - name: nginx
              image: nginx:1.14.2
              ports:
              - containerPort: 80
    ```
  ),
  text: [
    - What k8s objects will this create?
    - How many pods will the cluster start?
    - What container image is being used?
  ]
)

#slide(title: [YAML from a running deployment], code(
  ```console
  $ kubectl get deployment -o yaml
  apiVersion: v1
  items:
  - apiVersion: apps/v1
    kind: Deployment
    metadata:
      annotations:
        deployment.kubernetes.io/revision: "1"
      creationTimestamp: "2020-07-09T20:22:31Z"
      generation: 1
      labels:
        app: hello-node
      name: hello-node
      namespace: default
      resourceVersion: "1816"
      selfLink: /apis/apps/v1/namespaces/default/deployments/hello-node
      uid: 31356fed-0365-49df-8327-3c3c6ff0cb32
    spec:
      progressDeadlineSeconds: 600
      replicas: 1
  <snip>
  ```
))


#slide(title: [Services])[
  Services make ports on pods available to other parts of the cluster _or_ the
  outside world:

  #code(
    ```console
    $ kubectl expose deployment hello-node --type=LoadBalancer --port=8080
    service/hello-node exposed

    $ kubectl get services
    NAME         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
    hello-node   LoadBalancer   10.105.154.187   localhost     8080:30031/TCP   100s
    kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP          32m
    ```
  )
]

#alternate(
  title: [Addition Kubenetes Resources],
  image: licensed-image(
    file: "/images/k8s-wishes.png",
    license: "FAIRUSE",
    title: [Kubernetes 3 Wishes],
    url: "https://faun.pub/top-20-kubernetes-memes-b5cb4c5af395"
  ),
  text: [
    - #link("https://kubernetes.io/docs/reference/kubectl/cheatsheet/")[kubectl Cheat sheet]
    - #link("https://kubernetes.io/docs/concepts/workloads/controllers/deployment/")[Deployments]
    - #link("https://kubernetes.io/docs/tutorials/hello-minikube/")[Hello Minikube]
    - #link("https://kubernetes.io/docs/concepts/services-networking/service/")[Services]
  ]
)
