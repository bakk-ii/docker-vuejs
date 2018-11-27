FROM node:11-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN npm install -g vue-cli
RUN npm install npm@latest -g && \
    npm install -g npm-check-updates && \
    npm install
COPY . .

EXPOSE 8686
