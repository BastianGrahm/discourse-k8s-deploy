#!/bin/bash -e

kubectl delete -f discourse.yml || echo "discourse.yml is already deleted"
