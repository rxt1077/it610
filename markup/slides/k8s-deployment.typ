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

#slide(title: [Containerizing the Application], side-by-side[
  #v(1fr)
  - Developed internally
  - Deployed to an internal container registry
  - Usually the end result of a CI/CD pipeline
  #v(1fr)
][
  #v(1fr)
  #image("/images/containers.jpg")
  #v(1fr)
])

#slide(title: [Designing K8s Objects], side-by-side(columns: (66%, 1fr))[
  #v(1fr)
  #image(height: 100%, "/images/k8s-objects.png")
  #v(1fr)
][
  #v(1fr)
  - Deployments
  - Services
  - Volumes
  #v(1fr)
])

#slide(title: [Testing])[
  #align(center, image(width: 75%, "/images/dilbert-k8s.png"))
  - Can users use it?
  - Can the admins use it?
  - Does is scale?
  - Can you update?
  - Can you rollback?
]

#slide(title: [Container Registry Options], side-by-side[
  #v(1fr)
  #image(width: 100%, "/images/container-registry.png")
  #v(1fr)
][
  #v(1fr)
  - self-hosted
  - #link("https://hub.docker.com")[Docker Hub] (not private)
  - #link("https://aws.amazon.com/ecr")[ECR]
  - #link("https://cloud.google.com/container-registry")[GCR]
  - #link("https://azure.microsoft.com/en-us/services/container-registry")[ACR]
  #v(1fr)
])

#slide(title: [Kubernetes Cluster Options], side-by-side[
  #v(1fr)
  - Self-hosted
  - k8s on IaaS
  - k8s as a service: (#link("https://aws.amazon.com/eks")[EKS], #link("https://azure.microsoft.com/en-us/services/kubernetes-service")[AKS], #link("https://cloud.google.com/kubernetes-engine")[GKE])
  - What's the CR interop?
  #v(1fr)
][
  #image("/images/k8s.svg")
])
