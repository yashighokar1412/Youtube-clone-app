#stage 1
FROM node:16 AS youtube

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

#stage 2
FROM node:16-slim

COPY --from=youtube /app .

EXPOSE 3000

CMD ["npm", "start"]
