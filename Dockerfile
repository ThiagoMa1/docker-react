FROM node:16-alpine as builder
WORKDIR /srv/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /srv/app/build /usr/share/nginx/html
