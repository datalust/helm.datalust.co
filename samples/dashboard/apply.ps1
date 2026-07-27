Push-Location $PSScriptRoot

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.0/aio/deploy/recommended.yaml
kubectl apply -f serviceaccount.yaml
kubectl apply -f rolebinding.yaml

Pop-Location
