Push-Location $PSScriptRoot

helm upgrade -f config.yaml seq-dev stable/seq

Pop-Location
