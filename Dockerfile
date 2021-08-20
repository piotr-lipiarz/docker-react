# tag of phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 
# everything will land in /app/build


# we only want to take build result from /app/build
# FROM statement terminates prervious
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html