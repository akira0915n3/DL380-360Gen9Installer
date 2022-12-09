#�����Ƌ@�\�̃C���X�g�[��
echo SNMPService ���C���X�g�[�����܂�
Install-WindowsFeature -Name SNMP-Service -IncludeManagementTools
Install-WindowsFeature -Name SNMP-WMI-Provider -IncludeManagementTools

echo Hyper-V Service ���C���X�g�[�����܂��B
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools

#�����[�g�f�X�N�g�b�v�̗L����
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Type Dword -Value "0"

#�����[�g�f�X�N�g�b�v��FW����(�h���C���E�v���C�x�[�g�̂�)
Set-NetFirewallRule -Profile Domain,Private -DisplayName "�����[�g �f�X�N�g�b�v - �V���h�E (TCP ��M)" -Enabled True
Set-NetFirewallRule -Profile Domain,Private -DisplayName "�����[�g �f�X�N�g�b�v - ���[�U�[ ���[�h (TCP ��M)" -Enabled True
Set-NetFirewallRule -Profile Domain,Private -DisplayName "�����[�g �f�X�N�g�b�v - ���[�U�[ ���[�h (UDP ��M) " -Enabled True

#ICMPv4�̋���(�h���C���E�v���C�x�[�g�̂�)
Set-NetFirewallRule -Profile Domain,Private -DisplayName "�t�@�C���ƃv�����^�[�̋��L (�G�R�[�v�� - ICMPv4 ��M)" -Enabled True