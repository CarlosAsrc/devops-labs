# Kubernetes
Pod configuration to deploy a docker image with the go microservice on a Minikube cluster.
## Requirements
- Kubectl installation. Use `./installation/kubectl_installation`
- Minikube installation. Use `./installation/minikube_installation`
- Jenkins kubernetes-plugin: https://github.com/jenkinsci/kubernetes-plugin

## RUNNING
- Jenkins Kubernetes Plugin configuration
    - First, a Jenkins Credential of type "certificate" named `kubernetes-certificate` needs to be configured to use it in Jenkins Kubernetes Plugin.
        - Use `secret` as the password.
        - Upload the `~/.minikube/minikube.pfx` certificate.
    - Then, is required a Kubernetes server certificate key. The server certificate key of Minikube cluster can be found in `~/.minikube/ca.crt`.
- Deployment
    - Make sure the Kubernetes Cluster is running. In this case, run `minikube start` to start minikube on `https://192.168.99.100:8443`.
    - Create a Jenkins pipeline script with the `./Jenkinsfile` and build it.
    - The go application will be available using `minikube service calculator` command, that will open `https://192.168.99.100:<service_port>` on the browser.

