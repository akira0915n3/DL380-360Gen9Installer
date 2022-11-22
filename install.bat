@@echo off

REM -管理者に昇格
openfiles > nul 2>&1
if %errorlevel% == 1 (
    Powershell Start-process -FilePath "%0" -Verb RunAs
)

rem -変数定義
set copypass=C:\Work

set n1=cp039985
set n2=cp037927
set n3=cp047793
set n4=cp047946
set n5=cp048869
set n6=cp052389
set n7=cp037465
set n8=cp047524
set n9=cp028326
set n10=C:\Work\cp041529\
set n11=C:\Work\cp048743\
set n12=cp047446
set n13=cp044526

set n10p=cp041529
set n11p=cp048743

set silent=.exe /s /f
set ins=.exe
set check="C:\cpqsystem\cpxml"
set checkHPSU="C:\Program Files (x86)\Hewlett-Packard\HP Support Solutions\HPSupportSolutionsFrameworkService.exe"

rem -インターネットに出れるか確認
ping google.com > nul && goto role-ins

echo ネットワークケーブルを接続してください。
pause

:role-ins
rem -役割のインストール
echo "SNMPServiceをインストールします。"
PowerShell -command "Install-WindowsFeature -Name SNMP-Service -IncludeManagementTools"
PowerShell -command "Install-WindowsFeature -Name SNMP-WMI-Provider -IncludeManagementTools"
echo "役割と機能のインストールが完了しました。"

:rdp-arrow
rdp.ps1


set errorlevel = 0

:app-n1
echo %n1%をインストールします。
call %copypass%\%n1%%silent%
echo %errorlevel%
if %errorlevel% neq 3 (
    goto app-n2
) else (
    goto error
)



:app-n2
echo %n2%をインストールします。
call %copypass%\%n2%%silent%
if %errorlevel% neq 3 (
    goto app-n3
) else (
    goto error
)

:app-n3
echo %n3%をインストールします。
call %copypass%\%n3%%silent%
if %errorlevel% neq 3 (
    goto app-n4
) else (
    goto error
)

:app-n4
echo %n4%をインストールします。
call %copypass%\%n4%%silent%
if %errorlevel% neq 3 (
    goto app-n5
) else (
    goto error
)

:app-n5
echo %n5%をインストールします。
call %copypass%\%n5%%silent%
echo %errorlevel%
if %errorlevel% neq 3 (
    goto app-n6
) else (
    goto error
)

:app-n6
echo %n6%をインストールします。
call %copypass%\%n6%%silent%
if %errorlevel% neq 3 (
    goto app-n7
) else (
    goto error
)

:app-n7
echo %n7%をインストールします。
call %copypass%\%n7%%silent%
if %errorlevel% neq 3 (
    goto app-n8
) else (
    goto error
)

:app-n8
echo %n8%をインストールします。
call %copypass%\%n8%%silent%
if %errorlevel% neq 3 (
    goto app-n9
) else (
    goto error
)

:app-n9
echo %n9%をインストールします。
call %copypass%\%n9%%silent%
if %errorlevel% neq 3 (
    goto app-n10
) else (
    goto error
)

:app-n10
echo %n10p%をインストールします。
call %n10%cpqsetup%silent%
if %errorlevel% neq 3 (
    goto app-n11
) else (
    goto error
)

:app-n11
echo %n11p%をインストールします。
call %n11%cpqsetup%silent%
if %errorlevel% neq 3 (
    goto app-n12
) else (
    goto error
)

:app-n12
echo %n12%をインストールします。
call %copypass%\%n12%%silent%
if %errorlevel% neq 3 (
    goto app-n13
) else (
    goto error
)

:app-n13
echo %n13%をインストールします。
call %copypass%\%n13%%silent%
if %errorlevel% neq 3 (
    timeout 20 /nobreak
    goto app-ins-to
) else (
    goto error
)

rem -2分待機
:app-ins-to
echo インストール完了中です...
timeout 120 /nobreak
goto diskcounter


:diskcounter
rem -ディスクカウンターのスタート
call diskperf -y
pause
goto reboot


:reboot
rem -再起動
echo 2分後に再起動します。
shutdown.exe /r /t 120
pause
exit

:error
echo エラーが発生しました。
echo 最初からやり直してください。
pause
exit