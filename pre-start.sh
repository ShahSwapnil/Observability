#!/bin/bash

# Check if the network named "local-dev" exists
network_exists=$(docker network ls | grep "local-dev")

if [[ -z "$network_exists" ]]; then
  	echo "Network 'local-dev' does not exist. Creating Network"
	docker network create local-dev
  # You can add logic here to create the network if needed
else
  echo "Network 'local-dev' exists."
fi
