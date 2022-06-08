Push-Location $PSScriptRoot

$chart = $env:SEQ_HELM_CHART_OR_PATH
if ($null -eq $chart) {
    $chart = "datalust/seq"
}

helm upgrade -f config.yaml seq-dev $chart

Pop-Location
