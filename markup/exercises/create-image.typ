#import "/templates/exercise.typ": exercise, code, admonition

#show: doc => exercise(
  course-name: "Systems Administration",
  exercise-name: "Creating a Container Image",
  doc,
)

== Goals

+ Use users and permissions in Linux
+ Create a custom container image
+ Build the container image
+ Run a container

== Background

In this exercise, you will be helping to create an image for a container that runs the #link("https://httpd.apache.org/")[Apache HTTP server] on #link("https:/rockylinux.org/")[Rocky Linux].
The final container should run Apache as the `www` user in the `www` group.

Imagine you are working with a junior sysadmin who is designing a container image to serve web pages.
The company you work for has a policy that all web servers must be run by a user named `www` within their environment.
Your partner is familiar with Redhat so they have decided to use Rocky Linux as the base for their image.
They give you a Dockerfile that isn't quite working and a few tips on what they think needs to be done.
Your job is to fix the Dockerfile so that it builds a working image that meets the requirements.

== Analysis

This is what they have so far (you'll find this in the class git repo as well):

#code([
  ```docker
  FROM docker.io/rockylinux:9
  RUN yum -y update
  RUN yum -y install httpd procps
  COPY httpd.conf /etc/httpd/conf/
  CMD httpd -DFOREGROUND
  ```
])

Try building and running this image by executing the following commands within
the `create-image` directory:

#code([
  ```console
  $ docker build -t my-image . <1>
  $ docker run -p 8000:8000 my-image <2>
  ```
  ], callouts: (
    ("<1>", [Don't forget the `.` here! You're building the Dockerfile _in the current directory_. `-t my-image` tells Docker to tag (name) the image as `my-image`]),
    ("<2>", [`-p 8000:8000` forwards port 8000 on the localhost to 8000 on the container]),
  )
)

=== Food for thought...

+ Does this work?
+ Is httpd running as `www`?
+ How could you check?
#pagebreak()

== Modifications

Change the Dockerfile so that Apache runs as `www` and it still works.

Here's some advice:

+ You will have to create a user named `www` and possibly a `www` group. Add RUN commands to the Dockerfile to use the tools we talked about in class.
+ `/var/run/httpd` and `/var/log/httpd` will need to be owned by this user (possibly recursively).
+ The #link("https://docs.docker.com/engine/reference/builder/#user")[USER command] can be used right before `CMD` to make Docker use a different `USER`.
+ Using the syntax in the Analysis section, you should be able to see if httpd is running by going to https://localhost:8000 when your container is running.

== Submission

Submit the text of your final Dockerfile to receive credit for this exercise.

#admonition([
  Feel free to leave me a comment telling my _why_ this is not the best way to solve this problem.
  _Reading the comments in httpd.conf may point you in the right direction_.
])
