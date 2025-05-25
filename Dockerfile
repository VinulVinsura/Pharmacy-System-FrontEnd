# Stage 1: Build the Angular app
FROM node:20 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve app with Nginx-
FROM nginx:1.25-alpine

# Remove the default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy compiled Angular app from builder
COPY --from=builder /app/dist/pharmacy-app/browser /usr/share/nginx/html/

# Copy custom nginx config (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

