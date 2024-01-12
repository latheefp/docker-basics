
kubectl create secret generic controller-manager \
    -n actions \
    --from-literal=github_app_id=<> \
    --from-literal=github_app_installation_id=<> \
    --from-file=github_app_private_key=<>



helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
helm repo update
helm search repo actions

> helm search repo actions
NAME                                                    CHART VERSION   APP VERSION     DESCRIPTION                                       
actions-runner-controller/actions-runner-contro...      0.23.5          0.27.5          A Kubernetes controller that operates self-host...



helm install actions \
    actions-runner-controller/actions-runner-controller \
    --namespace github-runner \
    --set syncPeriod=1m


helm template actions \
    actions-runner-controller/actions-runner-controller \
    --namespace github-runner \
    --set syncPeriod=1m

 #output.

    > helm install actions \
>     actions-runner-controller/actions-runner-controller \
>     --namespace github-runner \
>     --set syncPeriod=1m
creating 1 resource(s)
creating 1 resource(s)
creating 1 resource(s)
creating 1 resource(s)
creating 1 resource(s)
creating 18 resource(s)
NAME: actions
LAST DEPLOYED: Sat Oct 28 15:37:34 2023
NAMESPACE: github-runner
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace github-runner -l "app.kubernetes.io/name=actions-runner-controller,app.kubernetes.io/instance=actions" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace github-runner $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace github-runner port-forward $POD_NAME 8080:$CONTAINER_PORT