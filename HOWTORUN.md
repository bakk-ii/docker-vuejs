## 1. SETUP SOURCE
- Create Dockerfile
```
FROM node:11-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN npm install -g vue-cli
RUN npm install npm@latest -g && \
    npm install -g npm-check-updates && \
    npm install
COPY . .

EXPOSE 8686
```
- Create docker-compose.yml
```
version: '3'
services:
  web:
    build: .
    command: npm run dev
    ports:
      - "8686:8686"
    volumes:
      - .:/usr/src/app
      - /usr/src/app/node_modules
```
- Run command below and follow step by step
```
docker-compose run web vue init webpack
```

- Open file `/config/index.js` and change like below
```
host: 'localhost'
↓
host: '0.0.0.0'
```
```
port: 8080
↓
host: 8686
```
- Run
```
docker-compose up
```
