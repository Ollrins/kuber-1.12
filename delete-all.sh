#!/bin/bash

echo "=== Deleting all resources ==="

echo "1. Deleting web-consumer..."
kubectl delete deployment web-consumer -n web 2>/dev/null || echo "web-consumer not found"

echo "2. Deleting auth-db service in web namespace..."
kubectl delete svc auth-db -n web 2>/dev/null || echo "Service auth-db in web not found"

echo "3. Deleting auth-db deployment..."
kubectl delete deployment auth-db -n data 2>/dev/null || echo "auth-db not found"

echo "4. Deleting auth-db service in data namespace..."
kubectl delete svc auth-db -n data 2>/dev/null || echo "Service auth-db in data not found"

echo "5. Deleting namespaces..."
kubectl delete ns web data 2>/dev/null || echo "Namespaces not found"

echo "=== Cleanup complete ==="
