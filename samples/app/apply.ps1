Push-Location $PSScriptRoot

kubectl delete pod counter
kubectl apply -f app.yaml

Pop-Location
