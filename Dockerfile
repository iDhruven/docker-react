# Specify a Base Image
FROM node:alpine as builder

# Create a working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY ./ ./

# Default Command
RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
