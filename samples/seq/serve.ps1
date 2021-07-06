Push-Location $PSScriptRoot

Start-Job -ScriptBlock { kubectl proxy }
Start-Process http://localhost:8001/api/v1/namespaces/default/services/seq-dev:80/proxy/

Pop-Location
