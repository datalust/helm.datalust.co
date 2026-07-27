Push-Location $PSScriptRoot

Start-Job -ScriptBlock { kubectl proxy }
./get-token.ps1
Start-Process http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

Pop-Location
