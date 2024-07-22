#!/bin/bash
if [[ -z "${HOST_PROJECT_PATH}" ]] then
	export HOST_PROJECT_PATH="."
fi

docker-compose down