Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Type Dword -Value "0"
Set-NetFirewallRule -DisplayName "�����[�g �f�X�N�g�b�v - �V���h�E (TCP ��M)" -Enabled True
Set-NetFirewallRule -DisplayName "�����[�g �f�X�N�g�b�v - ���[�U�[ ���[�h (TCP ��M)" -Enabled True
Set-NetFirewallRule -DisplayName "�����[�g �f�X�N�g�b�v - ���[�U�[ ���[�h (UDP ��M)" -Enabled True