# Multi-step
# First step tagged as builder
FROM node:alpine
WORKDIR "/app"

# Aws may require ./ instead of .
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second step
FROM nginx
# Aws elastic beanstalk needs exposed port
EXPOSE 80

# If the named builder step is not working
# Try --from=0
COPY --from=0 /app/build /usr/share/nginx/html
# Default command of nginx is run

# docker run -p 8080:80 container_id
