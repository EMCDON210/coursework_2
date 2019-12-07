# get the node base imige
FROM node:10

# create a new directory to hold the server.js code
WORKDIR /usr/src/serverCode

COPY package*.json ./

RUN npm install

# bundle all apps code inside the Docker imige
COPY . .

# expose port 8080
EXPOSE 8080

