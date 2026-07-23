#!/bin/bash

echo "=== Applying all manifests ==="

echo "1. Creating namespaces..."
kubectl apply -f namespaces.yaml

echo "2. Deploying auth-db..."
kubectl apply -f auth-db-deployment.yaml

echo "3. Creating auth-db service in data namespace..."
kubectl apply -f auth-db-service.yaml

echo "4. Creating ExternalName service in web namespace..."
kubectl apply -f auth-db-service-externalname.yaml

echo "5. Deploying web-consumer..."
kubectl apply -f web-consumer-fixed.yaml

echo "=== Waiting for pods to be ready ==="
sleep 10

echo "=== Pods in web namespace ==="
kubectl get pods -n web

echo "=== Pods in data namespace ==="
kubectl get pods -n data

echo "=== Services in web namespace ==="
kubectl get svc -n web

echo "=== Services in data namespace ==="
kubectl get svc -n data

echo "=== Logs from web-consumer ==="
kubectl logs -n web deployment/web-consumer --tail=5
