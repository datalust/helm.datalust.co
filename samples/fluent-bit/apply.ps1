Push-Location $PSScriptRoot

helm repo add fluent https://fluent.github.io/helm-charts
helm repo update

helm delete fluent-bit
helm upgrade --install -f config.yaml fluent-bit fluent/fluent-bit

Pop-Location
