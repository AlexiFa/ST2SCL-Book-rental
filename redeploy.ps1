# Define the namespace and deployments to delete and reapply
$deploy = $true
$delete = $true
$namespace = "project"  # Change this if your deployments are in a different namespace
$deployments = @("postgres-secret.yml", "postgres-storage.yml", "postgres-deployment.yml", "book-deployment.yml", "user-deployment.yml")  # Replace with your actual deployment names
$yamlFiles = @("user-deployment.yml", "postgres-deployment.yml", "postgres-storage.yml", "postgres-secret.yml", "book-deployment.yml")  # Replace with your actual YAML file paths

# # Ensure kubectl is installed
# if (-not (Get-Command kubectl -ErrorAction SilentlyContinue)) {
#     Write-Host "kubectl is not installed or not in PATH. Please install it first." -ForegroundColor Red
#     exit 1
# }

# Delete existing deployments
if ($delete) {
    foreach ($deployment in $yamlFiles) {
        Write-Host "Deleting deployment: $deployment..."
        kubectl delete -f $deployment -n $namespace
    }
}


# Apply the deployments back
if ($deploy) {
    foreach ($yaml in $deployments) {
        Write-Host "Applying deployment from: $yaml..."
        kubectl apply -f $yaml -n $namespace
    }
}

Write-Host "Redeployment completed successfully!" -ForegroundColor Green
