
## Setup EKS Cluster

1. **Clone the Repository**
    ```sh
    git clone https://github.com/your-repo/my-eks-project.git
    cd my-eks-project
    ```

2. **Initialize Terraform**
    ```sh
    terraform init
    ```

3. **Apply Terraform Plan**
    ```sh
    terraform apply -var-file=terraform.tfvars
    ```

4. **Configure kubectl**
    ```sh
    aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>
    ```

## Deploy ArgoCD

1. **Run the setup script**
    ```sh
    ./scripts/setup-argocd.sh
    ```

2. **Access ArgoCD UI**
    After running the setup script, ArgoCD will be exposed on port 8080. You can access it using the following URL:
    ```
    https://localhost:8080
    ```

3. **Login to ArgoCD**
    - The default username is `admin`.
    - Retrieve the password using:
      ```sh
      kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode; echo
      ```

## Deploy Sample Application with Prometheus and Grafana

1. **Run the deploy script**
    ```sh
    ./scripts/deploy-sample-app.sh
    ```

2. **Access Prometheus and Grafana**
    - Prometheus can be accessed using the `prometheus-server` service.
    - Grafana can be accessed using the `grafana` service.

## Monitoring Setup

1. **Configure Grafana Datasource**
    - The `grafana-datasource.yaml` is applied as part of the deploy script.
    - Verify the configuration by accessing Grafana and checking the Prometheus data source.

## Cleanup

To delete the resources created by Terraform, run:
```sh
terraform destroy -var-file=terraform.tfvars
