Push-Location $PSScriptRoot

kubectl -n kubernetes-dashboard create token dashboard-user

Pop-Location
