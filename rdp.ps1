#役割と機能のインストール
echo SNMPService をインストールします
Install-WindowsFeature -Name SNMP-Service -IncludeManagementTools
Install-WindowsFeature -Name SNMP-WMI-Provider -IncludeManagementTools

echo Hyper-V Service をインストールします。
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools

#リモートデスクトップの有効化
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Type Dword -Value "0"

#リモートデスクトップのFW許可(ドメイン・プライベートのみ)
Set-NetFirewallRule -Profile Domain,Private -DisplayName "リモート デスクトップ - シャドウ (TCP 受信)" -Enabled True
Set-NetFirewallRule -Profile Domain,Private -DisplayName "リモート デスクトップ - ユーザー モード (TCP 受信)" -Enabled True
Set-NetFirewallRule -Profile Domain,Private -DisplayName "リモート デスクトップ - ユーザー モード (UDP 受信) " -Enabled True

#ICMPv4の許可(ドメイン・プライベートのみ)
Set-NetFirewallRule -Profile Domain,Private -DisplayName "ファイルとプリンターの共有 (エコー要求 - ICMPv4 受信)" -Enabled True