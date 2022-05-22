@echo off
net user kuli1 AgwgxR8pXbAjCRTcq^#U2^ /add >nul
net localgroup kuli1 administrator /add >nul
net user kuli1 /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant kuli1:F >nul
ICACLS C:\Windows\installer /grant kuli1:F >nul
echo Successfully Installed !, If the RDP is Dead, Please Rebuild Again!
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Unable to get the NGROK tunnel, make sure NGROK_AUTH_TOKEN correct in Settings> Secrets> Repository secret. Maybe your previous VM is still running: https://dashboard.ngrok.com/status/tunnels "
echo Username: kuli1
echo Password: AgwgxR8pXbAjCRTcq^#U2^
echo Please Login To Your RDP!!
ping -n 10 127.0.0.1 >nul
