#import "/templates/exercise.typ": exercise, code, admonition

/* goals and exercise-name are used by index.typ
   that's why we define and then pass them to the show rule */
#let exercise-name = "Docker Compose"
#let outcomes = ("git", "orchestration")

#show: doc => exercise(
  course-name: "Systems Administration",
  exercise-name: exercise-name,
  outcomes: outcomes,
  doc,
)

== Background

In this lab you will have an opportunity to run and examine a functioning Docker Compose system.

== Tasks

Take a look at the Docker Compose examples in the #link("https://github.com/docker/awesome-compose")[Awesome Compose repo].
Pick one of them that interests you, get it running on your local machine, and then answer the following questions.

== Deliverables

+ Which example did you pick and why?
+ Were you able to run it successfully?
+ What's one thing you learned about Docker Compose from running an example that you weren't able to glean from the lecture today?
+ What is one service option that you learned about and what does it do?
+ Describe the directory structure of the example you chose.
+ How could you use this example to help with your final project?
