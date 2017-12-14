FROM node:alpine

WORKDIR /usr/app

COPY package.json /usr/app

RUN npm i

COPY . /usr/app

ENV PORT=8080
ENV DB_URL='mongodb://mongo/users'

EXPOSE 8080

ENTRYPOINT ["npm", "start"]