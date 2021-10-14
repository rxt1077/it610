# Snipe-IT Containerization Demo

Currently this project has a Dockerfile for setting up the PHP side of Snipe-IT

You can test build it using: `docker build -t snipe-it .`
You can run it by using: `docker -p 8080:80 run snipe-it`
You can then visit http://localhost:8080 to run through the pre-install checklist