# one time build needed container
FROM node:alpine as builder
WORKDIR '/usr/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# production container
FROM nginx
# we just need build directory from react
COPY --from=builder /usr/app/build /usr/share/nginx/html