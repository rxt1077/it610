#import "/templates/exercise.typ": exercise, code, admonition

/* outcomes and exercise-name are used by index.typ
   that's why we define and then pass them to the show rule */
#let exercise-name = "Creating a Debian Package"
#let outcomes = (
  "shell", "text", "files", "use-pkg", "create-pkg", "manage-containers",
  "create-images", "build-images",
)

#show: doc => exercise(
  course-name: "Systems Administration",
  exercise-name: exercise-name,
  outcomes: outcomes,
  doc,
)

== Background

In this exercise we will be:

+ Installing #link("https://github.com/jay0lee/GAM")[GAM] on an Ubuntu container via their installation script
+ Creating a Debian package for GAM
+ Creating a Dockerfile for a container that installs GAM from your package

== Running the Ubuntu Container

`git pull` the #link("https://github.com/rxt1077/it610.git")[class repo] to get the most up-to-date version.
You may need to #link("https://git-scm.com/docs/git-stash")[`git stash` your changes] if you have made any.

`cd` into `exercises/create-deb` and build the container, tagging it as `create-deb`.
Then interactively run `bash` on the container, bind mounting `output` on the host to `/output` on the container:

#code([
  ```console
  $ docker build -t create-deb . <1>
  STEP 1/3: FROM docker.io/library/ubuntu
  Trying to pull docker.io/library/ubuntu:latest...
  Getting image source signatures
  Copying blob a1a21c96bc16 done   | 
  Copying config ce8f79aecc done   | 
  Writing manifest to image destination
  STEP 2/3: RUN apt-get update
  Get:1 http://archive.ubuntu.com/ubuntu noble InRelease [256 kB]
  ... <2>
  --> 0bb629520f75
  STEP 3/3: RUN apt-get install -y curl python3 xz-utils
  Reading package lists...
  Building dependency tree...
  Reading state information...
  ...
  COMMIT create-deb
  --> 276150cb90ad
  Successfully tagged localhost/create-deb:latest
  276150cb90ad62993ad19a61d59bf2accd331b41bf2deee0029acbbcbc1d4f59
  $ docker run -it -v "$(pwd)/output:/output" create-deb bash <3>
  root@5c57be59d30b:/# <4>
  ```],
  callouts: (
    "<1>": [
      This first command builds the image from the Dockerfile and tags it as `create-deb`.
      Your output may look slightly different, this was built on a Linux machine using #link("https://podman.io/")[podman] with `alias docker=podman`.
    ],
    "<2>": [
      When you see `...`, it means I've taken out some of the output to save space.
    ],
    "<3>": [
      This second command runs bash on our `create-deb` image _with_ the output directory on our host linked to `/output` in the container.
    ],
    "<4>": [
      Notice how the prompt changed? We are now executing commands _inside_ our container.
    ],
  ),
)

#admonition[
  The second command make look a little bit strange at first.
  `$(pwd)/output:/output` should give us an absolute path to the host's output directory in Linux, Windows, and MacOS.
  If the paths specified in a bind mount are _not_ absolute the mount may fail silently!
]

== Installing GAM

Read the GAM README.md in #link("https://github.com/jay0lee/GAM")[their GitHub repository] and follow the directions to install GAM from the BASH prompt on the running container.
The script will ask you if you have a full browser.
You can type in 'N', but it really shouldn't matter.
The script will also ask if you want to set up a Google API project for GAM.
You can type in 'N' because we will not actually be linking this to a real Google admin account.

Read the output from the installation script _carefully_.
You will need to know where you can find the `gam` binary.

== Creating a Debian Package

A Debian package is built from a directory single with a very specific structure.
We'll call this the _deb package directory_.
The _deb package directory_ should be named whatever you want to call your package.
Within that directory there is a `DEBIAN` directory with a control file.
The files your package will install are the _deb package directory_ in the locations where they will be installed on a system.

This is probably easier seen than described:

#code([
  ```console
  package-name/ <1> 
  package-name/DEBIAN <2>
  package-name/DEBIAN/control <3>
  package-name/usr/bin/package-binary <4>
  package-name/etc/package-config.toml <5>
  ```
], callouts: (
  "<1>": [The whole thing is in a single _deb package directory_],
  "<2>": [A special directory named `DEBIAN` contains files used by the Debian package tools to build the package],
  "<3>": [Within the `DEBIAN` there is a `control` file that gives details about the package],
  "<4>": [This package installs a binary file called `package-binary` in `/usr/bin/`],
  "<5>": [This package also installs a configuration file called `package-config.toml` in `/etc/`],
))

Go ahead and make the directory structure for your package, don't forget to give it a name, in the `/output` directory on your container.
You'll need to use the #link("https://man7.org/linux/man-pages/man1/mkdir.1.html")[`mkdir`] and #link("https://man7.org/linux/man-pages/man1/cd.1p.html")[`cd`] commands.

Copy (#link("https://man7.org/linux/man-pages/man1/cp.1.html")[`cp`]) the `gam` binary (you paid attention to where it was installed, right?) into your package as well.
You'll probably want to install it in `/usr/bin/` as it's a tool that is used by any user on the system.

Finally, you'll need to create a `control` file for your package in the `DEBIAN` directory.
You can do this within the container using a console text editor (`apt install nano` or maybe `apt install neovim` if you prefer) or you can do it on the host system using the bind mounted `output` directory.

Here is an example control file that you can adjust to meet the needs of your package:

#code([
  ```control
  Package: package-name <1>
  Version: 1.0
  Section: custom
  Priority: optional
  Architecture: all <2>
  Essential: no
  Installed-Size: 1024 <3>
  Maintainer: your-name-here <1>
  Description: In a line, what does this do? <1>
  ```
], callouts: (
  "<1>": [you will need to update these],
  "<2>": [believe it or not `gam` is actually a Python script, so this architecture is fine],
  "<3>": [technically this is in 1 KiB units, for this exercise you don't have to calculate it],
))

Once you have your _deb package directory_ all set, with a control file and the `gam` binary in it you can build it with `dpkg-deb --build package-name` executed from the directory above your _deb package directory_ and with `package-name` set to the name of your _deb package directory_.

Once you've run the `dpkg-deb` command you'll end up with the deb file.
This is your package!
Assuming the package was created in the `/output` directory you will be able to access it from the host machine.
Double-check that you can access the file _before_ you exit the container.


== Creating a Dockerfile for an Image That Uses Your Package

Take a look at the Dockerfile in the main exercise directory: `it610/exercises/create-deb`.
Make your own Dockerfile in the `output` directory that copies your `.deb` package into the image and installs it with `dpkg -i`.

Relevant documentation can be found here:

- #link("https://docs.docker.com/engine/reference/builder/#from")[Dockerfile reference: FROM]
- #link("https://docs.docker.com/engine/reference/builder/#copy")[Dockerfile reference: COPY]
- #link("https://docs.docker.com/engine/reference/builder/#run")[Dockerfile reference: RUN]
- #link("https://linux.die.net/man/1/dpkg")[dpkg man page]

== Questions

Now that you know how to make a package file and use it when creating custom images, please answer the following questions in the text submission section of this assignment:

+ Are there any security concerns with installing an application like GAM via a shell script? Give examples.
+ What is the GAM installation script written in? What does it do?
+ What are the advantages of having a deb package for GAM as opposed to just using the installation script? What are the disadvantages?
+ What was the hardest part of this exercise?
