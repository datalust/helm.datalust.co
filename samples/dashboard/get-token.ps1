Push-Location $PSScriptRoot

kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | Select-String admin-user | ForEach-Object { $_ -Split '\s+' } | Select-Object -First 1)

Pop-Location
