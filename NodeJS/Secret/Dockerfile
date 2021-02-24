FROM alpine:latest

# Create app directory
WORKDIR /usr/src/app
RUN apk add --update nodejs nodejs-npm

# Install app dependencies
# A wildcard is used to en  sure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install --save dotenv express mysql body-parser
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "node", "server.js" ]
