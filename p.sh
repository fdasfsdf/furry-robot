Invoke-WebRequest https://raw.githubusercontent.com/adtitas/ngrok-rdp/main/resources/ngrok.zip -OutFile ngrok.zip
Invoke-WebRequest https://raw.githubusercontent.com/adtitas/ngrok-rdp/main/resources/start.bat -OutFile start.bat
Invoke-WebRequest https://raw.githubusercontent.com/adtitas/ngrok-rdp/main/resources/winrar.exe -OutFile winrar.exe
Expand-Archive ngrok.zip
.\ngrok\ngrok.exe authtoken NGROK_AUTH_TOKEN
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1
copy winrar.exe C:\Users\Public\Desktop\winrar.exe
Start-Process Powershell -ArgumentList '-Noexit -Command ".\ngrok\ngrok.exe tcp 3389"'
cmd /c start.bat
cmd /c C:\Users\Public\Desktop\winrar.exe winrar.exe /s
Invoke-WebRequest https://raw.githubusercontent.com/adtitas/ngrok-rdp/main/resources/loop.ps1 -OutFile loop.ps1
./loop.ps1

        
