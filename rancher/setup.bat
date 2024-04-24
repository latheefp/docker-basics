REM copy %USERPROFILE%\.kube\config %USERPROFILE%\Desktop\kubeconfig
set KUBECONFIG=kubeconfig
kubectl config view
