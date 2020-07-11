#!/bin/bash

echo "Apply discourse deployment to kubernetes"
kubectl apply -f discourse.yml
