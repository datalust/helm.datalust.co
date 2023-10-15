Push-Location $PSScriptRoot

# In minikube, you can run `minikube service seq-dev --url` instead
Start-Job -ScriptBlock { kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80 }
Start-Process http://seq-dev.local:8080

Pop-Location
