# adapted from https://github.com/earthly/example-dos-gaming/blob/main/Dockerfile
FROM node:16-alpine

# Set up JS-DOS, NPM packages
WORKDIR /site
RUN wget https://js-dos.com/6.22/current/js-dos.js
RUN wget https://js-dos.com/6.22/current/wdosbox.js
RUN wget https://js-dos.com/6.22/current/wdosbox.wasm.js
RUN npm install -g serve

# Set up game hosting
COPY index.html .
COPY elf11.zip .
ENTRYPOINT ["npx", "serve", "-l", "tcp://0.0.0.0:8000"]
