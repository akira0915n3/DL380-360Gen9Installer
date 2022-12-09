@echo off
chcp 65001

echo -------------------------------------------------------------------
echo --DL380/360 Gen9 DriverInstallerTool AkiraEkawa 2022/11/22 Ver2.0--
echo -------------------------------------------------------------------

rem 変数定義-------------------------------------------
set copypass=C:\Work
set cp041529=C:\Work\cp041529
set cp048743=C:\Work\cp048743
set /p yn_check=ファイルのコピーを開始しますか？(y/n)

set 

rem y/n実装-------------------------------------------
if %yn_check:Y=Y%==Y (
    rem yの場合の処理---------------------------------
    echo yが選択されました。開始します。
    
    IF EXIST %copypass% (
        echo フォルダが存在します。
        goto exit
    )ELSE (
        rem ファイルコピー---------------------------
        mkdir %copypass%
        mkdir %cp041529%
        mkdir %cp048743%
	    attirb +h %cp041529%
	    attirb +h %cp048743%
        copy  .\batwork\* %copypass%
        copy  .\batwork\cp041529\ %cp041529%
        copy  .\batwork\cp048743\ %cp048743%

        rem ----------------------------------------

        echo.
        echo.
        echo コピーが完了しました。
        echo パス %copypass%
        goto :install
    )
   
)ELSE (
rem nまたはそれ以外の処理-----------------------------
    :exit
    echo キーを押して終了してください。
    pause
)


:install
echo インストールを開始します。
call ./install.bat
