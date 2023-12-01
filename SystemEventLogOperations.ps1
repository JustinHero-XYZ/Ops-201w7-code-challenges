# Script: SystemEventLogOperations.ps1
# Author: Justin Patterson
# Date: November 30, 2023
# Description: PowerShell script to perform various operations on the System event log.

# Output all events from the System event log in the last 24 hours to last_24.txt
Get-WinEvent -LogName System -FilterHashtable @{LogName='System'; StartTime=(Get-Date).AddDays(-1)} | Out-File "$env:USERPROFILE\Desktop\last_24.txt"

# Output all "error" type events from the System event log to errors.txt
Get-WinEvent -LogName System -FilterHashtable @{LogName='System'; Level=2} | Out-File "$env:USERPROFILE\Desktop\errors.txt"

# Print to the screen all events with ID of 16 from the System event log
Get-WinEvent -LogName System -FilterHashtable @{LogName='System'; Id=16} | Format-Table

# Print to the screen the most recent 20 entries from the System event log
Get-WinEvent -LogName System -MaxEvents 20 | Format-Table

# Print to the screen all sources of the 500 most recent entries in the System event log
Get-WinEvent -LogName System -MaxEvents 500 | Format-Table TimeCreated, ProviderName, Id, Message -Wrap
