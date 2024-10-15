https://github.com/ansible/awx-operator/blob/devel/docs/installation/creating-a-minikube-cluster-for-testing.md

#install helmm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


#helm repo add awx-operator https://ansible.github.io/awx-operator/
helm repo update
helm search repo awx-operator
helm install -n awx --create-namespace my-awx-operator awx-operator/awx-operator
 kubectl get pods -n awx


kubectl config set-context --current --namespace=awx


 kubectl logs -f deployments/awx-operator-controller-manager -c awx-manager

 latheef@ubuntu-22:~$ kubectl get deployment --show-labels=true
NAME                              READY   UP-TO-DATE   AVAILABLE   AGE   LABELS
awx-demo-task                     1/1     1            1           14h   app.kubernetes.io/component=awx,app.kubernetes.io/managed-by=awx-operator,app.kubernetes.io/operator-version=2.17.0,app.kubernetes.io/part-of=awx-demo,app.kubernetes.io/version=24.4.0
awx-demo-web                      1/1     1            1           14h   app.kubernetes.io/component=awx,app.kubernetes.io/managed-by=awx-operator,app.kubernetes.io/name=awx-demo-web,app.kubernetes.io/operator-version=2.17.0,app.kubernetes.io/part-of=awx-demo,app.kubernetes.io/version=24.4.0
awx-operator-controller-manager   1/1     1            1           2d    app.kubernetes.io/managed-by=Helm,control-plane=controller-manager,helm.sh/chart=awx-operator
latheef@ubuntu-22:~$

//apply node port.

latheef@ubuntu-22:~$  kubectl get secret awx-demo-admin-password -o jsonpath="{.data.password}" | base64 --decode ; echo
iCzK0RKSQTuDUovY6mZDeLGi5EhqbrPW
