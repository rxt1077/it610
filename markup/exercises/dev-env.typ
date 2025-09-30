#import "/templates/exercise.typ": exercise, code, admonition

/* goals and exercise-name are used by index.typ
   that's why we define and then pass them to the show rule */
#let exercise-name = "Creating a Developer Environment"
#let goals = ( 
    "Create a multi-container development environment using a container orchestration tool",
)

#show: doc => exercise(
  course-name: "Systems Administration",
  exercise-name: exercise-name,
  goals: goals,
  doc,
)

== Background

Imagine that you are a recent hire for a frog-themed startup named ElFroggo.
You are part of the operations team and you recieve the following email:

#quote(attribution: [Susan J. Developer], block: true)[
  Hello and Welcome to ElFroggo,

  I'm looking for options for a quick interface to our frog database front-end and I'm thinking about using Flask and PostgreSQL.
  Do you have some way I could test this environment on my Desktop?
  I'd like a couple of rows of test data in a table called `Frogs` with the columns `ID`, `Name`, `ScientificName`, `Color`.
  I'd also like a Flask example that shows how to use the `psycopg2-binary` package to connect to the db.

  Thanks,
]

Design a system that meets Susan's needs using either Docker Compose or Kubernetes.

== Deliverables

Submit the files that you would give to Susan.

== Resources

- #link("https://www.psycopg.org/docs/install.html", [Psoycopg documentation])
- #link("https://www.docker.com/blog/how-to-use-the-postgres-docker-official-image/", [How to Use the Postgres Docker Official Image])
- #link("https://stefanopassador.medium.com/docker-compose-with-python-and-posgresql-45c4c5174299", [Docker Compose with Python and PostgreSQL])


