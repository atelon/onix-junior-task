# node:14.16-buster -> ... -> debian:buster
FROM node:14.16-buster

RUN apt-get update -y \
  && apt-get install -y argon2

ENV NODE_ENV DEVELOPMENT

WORKDIR /app

COPY . .

RUN npm install -g node-gyp \
  && npm install -g @nestjs/cli \
  && npm install

EXPOSE 3000 9229

CMD [ "npm", "run", "start:dev" ]
