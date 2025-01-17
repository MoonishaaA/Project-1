#!/bin/bash

IMAGE_NAME="my-app"

echo "Building Docker image: $IMAGE_NAME"
sudo docker build -t $IMAGE_NAME .

if [ $? -eq 0 ]; then
    echo "Docker image '$IMAGE_NAME' built successfully."
else
    echo "Error: Failed to build Docker image."
    exit 1
fi
