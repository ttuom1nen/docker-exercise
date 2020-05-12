# Multi-step
# First step tagged as builder
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second step
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# Default command of nginx is run

# docker run -p 8080:80 container_id
