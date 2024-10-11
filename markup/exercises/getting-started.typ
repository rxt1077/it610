#import "/templates/exercise.typ": exercise, code, admonition

#show: doc => exercise(
  course-name: "Systems Administration",
  exercise-name: "Getting Started",
  doc,
)

== Goals

+ Install git
+ Install Docker
+ git pull the class git repository
+ Build a custom Docker image
+ Run a container

== Installing git

You have a few options for installing git, one of which is #link("https://desktop.github.com/download/")[GitHub Desktop] which includes a few cools tools for GitHub as well.
If you want to install git without the GitHub tools you can also use:

=== Windows
- #link("https://gitforwindows.org/")[git for windows]: Installs git, git BASH, and a GUI.
  The git command can then be run from PowerShell, CMD, or the BASH shell (which it installs).

=== MacOS
- #link("https://sourceforge.net/projects/git-osx-installer/files/")[git for Mac Installer]: Provides an easy installer for git on MacOS. 
- #link("https://developer.apple.com/xcode/")[Xcode]: Xcode installs a command line git and you may have  it installed already.

== Installing Docker

Follow #link("https://docs.docker.com/desktop/")[these instructions] to install Docker Desktop.

== Cloning the Class git Repository

#admonition([
  Everything shown after the `$` prompt is the text you need to run in a terminal.
  Lines that do not start with a `$` are the output of the commands.
  Yours should match what is show but your prompt will probably be different.
  A prompt will _usually_ show you what directory you are in.
])

#admonition([
  In MacOS, you can use the Terminal application, in Windows you can use PowerShell or Windows Terminal to execute these commands.
])

#code([
  ```console
  $ git clone https://github.com/rxt1077/it610.git <1>
  Cloning into 'IS601'...
  remote: Enumerating objects: 43, done.
  remote: Counting objects: 100% (43/43), done.
  remote: Compressing objects: 100% (35/35), done.
  remote: Total 43 (delta 4), reused 43 (delta 4), pack-reused 0
  Unpacking objects: 100% (43/43), done.
  ```
  ], callouts: (
    ("<1>", [
      Make sure you are in a directory where you have write permissions.
      In Windows you can typ `cd ~` to change to your home directory.
      In MacOS you should start in your home directory, but you can run `cd` just to be sure.
      `cd` with no directory defaults to home in MacOS / Linux.]),
  )
)

== Building a Custom Docker Image

#code([
  ```console
  $ cd it610/exercises/getting-started <1>
  it610/exercises/1 $ docker build -t getting-started . <2>
  Sending build context to Docker daemon  5.632kB <3>
  Step 1/2 : FROM ubuntu:20.04
  20.04: Pulling from library/ubuntu
  d51af753c3d3: Pull complete
  fc878cd0a91c: Pull complete
  6154df8ff988: Pull complete
  fee5db0ff82f: Pull complete
  Digest: sha256:8bce67040cd0ae39e0beb55bcb976a824d9966d2ac8d2e4bf6119b45505cee64
  Status: Downloaded newer image for ubuntu:20.04
   ---> 1d622ef86b13
  Step 2/2 : RUN echo "bXkgb3RoZXIgY2FyIHJ1bnMgTGludXg=" | base64 -d > /message.txt
   ---> Running in 4528d351968b
  Removing intermediate container 4528d351968b
   ---> a09d3012fc11
  Successfully built a09d3012fc11
  Successfully tagged getting-started:latest
  ```
  ], callouts: (
    ("<1>", [Make sure you are in the `it610/exercises/1` directory]),
    ("<2>", [This tells Docker to build an image based on the Dockerfile in _this_ (`.`) directory and tag it as getting-started]),
    ("<3>", [It may take a moment to pull down the images this image is built from.]),
  )
)

== Running a Container

Now that we've built an image, we're create and run a container and then get a BASH shell on it.
That can all be done with a single command:

#code([
  ```console
  $ docker run -it getting-started bash <1>
  ```
  ], callouts: (
    ("<1>", [The `-it` option means that you want to run this container interactively and communicate with it via a tty.]),
  )
)

You are now _in_ a BASH shell running _inside_ a container of the custom image for this exercise.
From this shell, use your systems administration skills (feel free to Google) to read the contents of `/message.txt` and submit that phrase in the textbox for this assignment.

When you are done in the container type `exit` to exit the shell and stop the container.
