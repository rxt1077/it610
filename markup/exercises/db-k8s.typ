#import "/templates/exercise.typ": exercise

/* goals and exercise-name are used by index.typ
   that's why we define them and then pass them to the show rule */
#let exercise-name = "Exploring a Kubernetes Database Deployment"
#let outcomes = ("shell", "orchestration", "automation")

#show: doc => exercise(
  course-name: "Systems Administration",
  exercise-name: exercise-name,
  outcomes: outcomes,
  doc,
)

== Background

In this exercise you will have to opportunity to apply Kubernetes objects from a YAML file and use `kubectl` to explore a running system.

Inside the `exercises/db-k8s` directory you will find a `db-k8s.yml` file that has all of the objects we discussed during the presentation.
Your goal for this exercise is to `apply` those objects to your local Kubernetes instance using kubectl and explore the running system using the `get`, `describe`, and `logs` commands.
Feel free to try some database operations as well, you can get a bash prompt on any pod using `kubectl exec` just like you would with Docker.

== Questions

Please answer the following questions in the text box for this assignment.

+ A systems architect was using a stock Docker Hub image with a custom ENTRYPOINT point script she had designed.
  This required a Dockerfile, BASH script, and a directory to store them.
  When she migrated to Kubernetes she was able to do this all in one YAML file.
  Describe how this is possible.
+ Why are _Services_ essential to replication?
+ Why do we define two _Deployments_ for our example?
+ How can our database deployment be improved?
+ Compare and contrast Kubernetes _PersistentVolumeClaims_ with Docker Compose named volumes.
+ What does Kubernetes do when the `db-r` pod fails because `db-rw` is not up yet?
