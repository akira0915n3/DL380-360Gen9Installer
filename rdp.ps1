Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Type Dword -Value "0"
Set-NetFirewallRule -DisplayName "リモート デスクトップ - シャドウ (TCP 受信)" -Enabled True
Set-NetFirewallRule -DisplayName "リモート デスクトップ - ユーザー モード (TCP 受信)" -Enabled True
Set-NetFirewallRule -DisplayName "リモート デスクトップ - ユーザー モード (UDP 受信)" -Enabled True