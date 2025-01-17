#!/bin/bash

IMAGE_NAME="my-app"
CONTAINER_NAME="devops-build_web_1"

echo "Stopping and removing the old container (if any)..."
sudo docker stop $CONTAINER_NAME || true
sudo docker rm $CONTAINER_NAME || true

echo "Deploying Docker container from image: $IMAGE_NAME"
sudo docker run -d -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "Docker container '$CONTAINER_NAME' is running and accessible on port 80."
else
    echo "Error: Failed to deploy Docker container."
    exit 1
fi

