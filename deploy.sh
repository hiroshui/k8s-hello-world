#!/bin/bash
set -eu

export CONTAINER_REGISTRY="docker.fme-cloud.de"#replace with your image-registry
export REPOSITORY="k8s-images/hello-world"
export TAG_VERSION=$(cat version.info | head -n 1) #read first line of version.info.. currently no bigger check if valid !ToDo!

#Todo: check if docker and kubectl are previuously installed. if not.. install them ;-)

echo "[INFO]: Building the helloworld-image."
docker build -t "${CONTAINER_REGISTRY}/${REPOSITORY}:${TAG_VERSION}" -f image/Dockerfile

echo "[INFO]: Push the image"
docker push "${CONTAINER_REGISTRY}${REPOSITORY}:${TAG_VERSION}"

echo "[INFO]: Deploy image to kube-cluster."
kubectl create deployment hello-node --image="${CONTAINER_REGISTRY}/${REPOSITORY}:${TAG_VERSION}"

echo "[INFO]: Expose deployment as loadbalancer."
kubectl expose deployment hello-node --type=LoadBalancer --port=8080