# k8s-hello-world
Hello-World Deployment for K8S

This repo contains some scripts and files to create/build an hello-world image and use that one to start a deployment to a K8S-cluster.

Basicly node.js is used for creating a listening http-server which will always respond with a 200-httpstatus and the message from which pod it was send (by IP).
