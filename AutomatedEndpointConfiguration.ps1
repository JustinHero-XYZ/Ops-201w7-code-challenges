# Script: AutomatedEndpointConfiguration.ps1
# Author: Justin Patterson
# Date: 12/05/2023
# Description: Automated Endpoint Configuration

##Enable File and Printer Sharing
Set-NetFirewallRule -DisplayGroup "File And Printer Sharing" -Enabled True

##Allow ICMP traffic
netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4 


##Enable Remote management
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f


##Remove bloatware
##GitHub page says this is outdated but added just in case
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))


##Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All


##Disable SMBv1, an insecure protocol
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
