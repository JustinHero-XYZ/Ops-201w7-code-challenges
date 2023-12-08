# Script: PowershellIPAnalysis.ps1
# Author: Justin Patterson
# Date: 12/08/2023
# Description: Powershell IP Analysis

# Function to create the network_report.txt file
function Create-NetworkReport {
    $filePath = "network_report.txt"
    ipconfig /all > $filePath
    Write-Host "$filePath created successfully."
    return $filePath
}

# Function to search for IPv4 address in network_report.txt
function Search-IPv4Address {
    param (
        [string]$filePath
    )
    $ipv4Address = Select-String -Path $filePath -Pattern 'IPv4 Address' | ForEach-Object { $_.Matches.Groups[1].Value }
    Write-Host "IPv4 Address found: $ipv4Address"
}

# Function to remove the network_report.txt file
function Remove-NetworkReport {
    param (
        [string]$filePath
    )
    Remove-Item -Path $filePath -Force
    Write-Host "$filePath removed successfully."
}

# Main script
$reportPath = Create-NetworkReport
Search-IPv4Address -filePath $reportPath
Remove-NetworkReport -filePath $reportPath

