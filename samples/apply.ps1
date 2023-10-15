Push-Location $PSScriptRoot

Write-Host "Installing NGINX Ingress Controller"
Write-Host "-----------------------------------"
./nginx-controller/apply.ps1
Write-Host

Write-Host "Installing Seq"
Write-Host "--------------"
./seq/apply.ps1
Write-Host


Write-Host "Installing FluentBit Daemon Set"
Write-Host "-------------------------------"
./fluent-bit/apply.ps1
Write-Host

Write-Host "Installing a sample app"
Write-Host "-----------------------"
./app/apply.ps1
Write-Host

Write-Host "Ready to go!"
Write-Host "------------"
Write-Warning "Add `seq-dev.local` to your hosts file to access Seq"
Write-Host "Run: `./dashboard/serve.ps1` to access the Kubernetes dashboard"
Write-Host "Run: `./seq/serve.ps1` to access Seq"

Pop-Location
