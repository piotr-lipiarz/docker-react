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

# usually this instruction does nothing locally
# it mostly comunicates to developer that this port 
# will need to be mapped
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html