# get the node base imige
FROM node:10

# bundle all apps code inside the Docker imige
COPY . .

# expose port 8080
EXPOSE 8080

# run the server.js file
CMD node server.js

