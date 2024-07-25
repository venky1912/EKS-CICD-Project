#!/bin/bash

# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Expose ArgoCD server with a LoadBalancer service
cat <<EOF | kubectl apply -n argocd -f -
apiVersion: v1
kind: Service
metadata:
  name: argocd-server
spec:
  type: LoadBalancer
  selector:
    app.kubernetes.io/name: argocd-server
  ports:
  - name: http
    port: 80
    targetPort: 8080
  - name: https
    port: 443
    targetPort: 8080
EOF

# Wait for the LoadBalancer to be assigned an external IP
# Expose ArgoCD server as LoadBalancer service
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# Get the external IP of the LoadBalancer
echo "Waiting for LoadBalancer IP..."
while [ -z "$(kubectl get svc argocd-server -n argocd -o jsonpath='{.status.loadBalancer.ingress[0].ip}')" ]; do
  sleep 10
done

EXTERNAL_IP=$(kubectl get svc argocd-server -n argocd -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

#echo "ArgoCD is accessible at https://${EXTERNAL_IP}"echo "Waiting for the LoadBalancer to be assigned an external IP..."
#while [ -z "$(kubectl get svc argocd-server -n argocd -o jsonpath='{.status.loadBalancer.ingress[0].ip}')" ]; do
 # sleep 10
#done

# Get the external IP of the LoadBalancer
#ARGOCD_IP=$(kubectl get svc argocd-server -n argocd -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
#echo "ArgoCD server is exposed at IP: $ARGOCD_IP"

# Output the initial admin password
##ßßARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode)
#ßßecho "ArgoCD Initial Admin Password: $ARGOCD_PASSWORD"

