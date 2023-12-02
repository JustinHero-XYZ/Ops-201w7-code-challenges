# Script: BasicProcessManagement.ps1
# Author: Justin Patterson
# Date: 12/02/2023
# Description: Print processes to terminal


# Task 1: Print all active processes ordered by highest CPU time consumption
Get-Process | Sort-Object CPU -Descending | Format-Table Name, CPU -AutoSize

# Task 2: Print all active processes ordered by highest Process Identification Number (PID)
Get-Process | Sort-Object Id -Descending | Format-Table Name, Id -AutoSize

# Task 3: Print the top five active processes ordered by highest Working Set (WS(K))
Get-Process | Sort-Object WS -Descending | Select-Object -First 5 | Format-Table Name, WS -AutoSize

# Task 4: Start a browser process and open https://owasp.org/www-project-top-ten/
Start-Process -FilePath "chrome.exe" -ArgumentList "https://owasp.org/www-project-top-ten/"

# Task 5: Start Notepad ten times using a for loop
for ($i = 1; $i -le 10; $i++) {
    Start-Process -FilePath "notepad.exe"
}

# Task 6: Close all instances of Notepad
Stop-Process -Name "notepad" -Force

# Task 7: Kill a process by its Process Identification Number (PID)
# Note: Replace [ReplaceWithPID] with the actual PID of the process to be terminated
$pidToKill = [ReplaceWithPID]
Stop-Process -Id $pidToKill -Force
