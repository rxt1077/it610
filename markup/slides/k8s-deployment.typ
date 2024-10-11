#import "/templates/slides.typ": *

#show: university-theme.with(
  short-title: [K8s Deployment],
)

#title-slide(
  title: [Deploying an Application on Kubernetes],
)

#focus-slide[What do we need to know about an app before we deploy on Kubernetes?]

#matrix-slide(columns: 3, rows: 2,
  [What are the different parts of this app?],
  [Which part faces the users?],
  [Who are the admins?],
  [Which parts are stateful?],
  [What resources does this app require?],
  [What is the baseline for use?],
)

#alternate(
  title: [Containerizing the Application],
  image: licensed-image(
    file: "/images/containers.jpg",
    license: "CC BY 2.0",
    title: [Multicolored containers],
    url: "https://www.flickr.com/photos/93755244@N00/3144199355",
    author: [Håkan Dahlström],
    author-url: "https://www.flickr.com/photos/93755244@N00",
  ),
  text: [
    - Developed internally
    - Deployed to an internal container registry
    - Usually the end result of a CI/CD pipeline
  ],
)

#alternate(
  title: [Designing K8s Objects],
  image: licensed-image(
    file: "/images/k8s-objects.svg",
    license: "CC BY 4.0",
    title: [Kubernetes Icons Set],
    url: "https://github.com/kubernetes/community/tree/master/icons",
    author: [Etienne Coutaud],
    author-url: "https://github.com/etiennecoutaud",
  ),
  text: [
    - Deployments
    - Services
    - Volumes
  ]
)

#alternate(
  title: [Testing],
  image: licensed-image(
    file: "/images/k8s-meme.png",
    license: "FAIRUSE",
    title: [We use kubernetes now],
    url: "https://dchan.cc/a-kubernetes-jouney/",
  ),
  text: [
    - Can users use it?
    - Can the admins use it?
    - Does is scale?
    - Can you update?
    - Can you rollback?
  ],
)

#alternate(
  title: [Container Registry Options],
  image: licensed-image(
    file: "/images/container-registry.svg",
    license: "FAIRUSE",
    title: [Azure Container Registry Logo],
    url: "https://azure.microsoft.com/en-us/products/container-registry",
  ),
  text: [
    - self-hosted
    - #link("https://hub.docker.com")[Docker Hub] (not private)
    - #link("https://aws.amazon.com/ecr")[ECR]
    - #link("https://cloud.google.com/container-registry")[GCR]
    - #link("https://azure.microsoft.com/en-us/services/container-registry")[ACR]
  ]
)

#alternate(
  title: [Kubernetes Cluster Options],
  image: licensed-image(
    file: "/images/k8s.svg",
    license: "CC BY 4.0",
    title: [Kubernetes logo without workmark.svg],
    url: "https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg", 
    author: [Google, Inc],
    author-url: "https://www.google.com",
  ),
  text: [
    - Self-hosted
    - k8s on IaaS
    - k8s as a service: (#link("https://aws.amazon.com/eks")[EKS], #link("https://azure.microsoft.com/en-us/services/kubernetes-service")[AKS], #link("https://cloud.google.com/kubernetes-engine")[GKE])
    - What's the container registry (CR) interop?
  ]
)
