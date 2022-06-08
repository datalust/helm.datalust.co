Push-Location $PSScriptRoot

$chart = $env:SEQ_HELM_CHART_OR_PATH
if ($null -eq $chart) {
    $chart = "datalust/seq"
}

helm repo update
helm upgrade --install -f config.yaml seq-dev $chart

kubectl wait --for=condition=ready pod --selector=release=seq-dev --timeout=120s

Pop-Location
