# Step 1: Use a tiny web server image
FROM nginx:alpine

# Step 2: Copy everything FROM your 'app' folder INTO the web server folder
COPY ./app /usr/share/nginx/html

# Step 3: Tell Docker that the container listens on port 80
EXPOSE 80