FROM node:20-alpine

WORKDIR /app

COPY package.json .
COPY yarn.lock .
COPY medusa-config.ts .
COPY tsconfig.json .
COPY .env.production .env

RUN yarn install

COPY . .

RUN yarn build

EXPOSE 9000

CMD ["yarn", "start"]