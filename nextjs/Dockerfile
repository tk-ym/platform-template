FROM node:lts-alpine3.14

WORKDIR /usr/app

RUN npm install -g pm2

COPY ./app/package*.json ./

RUN npm install

COPY ./app ./

RUN npm run build

EXPOSE 3000

COPY nextjs-entrypoint.sh /usr/bin/
ENTRYPOINT ["/usr/bin/nextjs-entrypoint.sh"]
