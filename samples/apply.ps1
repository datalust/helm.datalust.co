Push-Location $PSScriptRoot

helm repo add datalust https://helm.datalust.co

# Create the dashboard for exploring our cluster
./dashboard/apply.ps1

# Create the ingress controller for exposing our Seq instance
./nginx-controller/apply.ps1

# Create the Seq pod for storing and searching logs
./seq/apply.ps1

# Create the fluent-bit daemon for collecting container logs
./fluent-bit/apply.ps1

# Create a test application that produces some logs
./app/apply.ps1

Write-Warning "Add `127.0.0.1 seq-dev.local` to your `hosts` file"

Start-Process "http://seq-dev.local"

Pop-Location
