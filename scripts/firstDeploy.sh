#!/bin/bash

# Define the tag naming standard
TAG_PREFIX="sprint"  # Change to "dev" if needed
CURRENT_SPRINT=""

# Function to check if a container is running
is_container_running() {
    local container_name="$1"
    [[ $(docker ps -q -f name="$container_name") ]] && return 0 || return 1
}

# Function to check if a container exists (running or stopped)
does_container_exist() {
    local container_name="$1"
    [[ $(docker ps -aq -f name="$container_name") ]] && return 0 || return 1
}

# Function to check if the image tag exists
does_image_tag_exist() {
    local image_name="$1"
    local tag="$2"
    docker manifest inspect "jamesispark/${image_name}:${tag}" >/dev/null 2>&1
}

# Get the current sprint number
read -p "Enter the current sprint number: " CURRENT_SPRINT

# Validate sprint input
if [[ ! "$CURRENT_SPRINT" =~ ^[0-9]+$ ]]; then
    echo "Invalid sprint number. Please enter a numeric value."
    exit 1
fi

# Define the images and their ports
declare -A services
services=(
    ["bucstop"]="80"
    ["bucstop_microtetris"]="8081"
    ["bucstop_microsnake"]="8082"
    ["bucstop_micropong"]="8083"
    ["bucstop_apigateway"]="8084"
)

# Pull images and run/update containers
for service in "${!services[@]}"; do
    tag="${TAG_PREFIX}_${CURRENT_SPRINT}"

    # Check if the image tag exists
    if does_image_tag_exist "${service}" "${tag}"; then
        echo "Pulling image: jamesispark/${service}:${tag}"
        docker pull "jamesispark/${service}:${tag}"
        image_to_run="jamesispark/${service}:${tag}"
    else
        echo "Tag ${tag} not found for ${service}. Pulling latest instead."
        docker pull "jamesispark/${service}:latest"
        image_to_run="jamesispark/${service}:latest"
    fi

    # Stop and remove the container if it exists
    if does_container_exist "${service}"; then
        echo "Stopping and removing existing container for ${service}..."
        docker stop "${service}" || true
        docker rm "${service}" || true
    fi

    # Run the container
    echo "Running container for ${service} on port ${services[$service]}..."
    docker run -d --name "${service}" -p "${services[$service]}:80" "${image_to_run}"
done

echo "Deployment complete."
