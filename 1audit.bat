@echo off&setlocal EnableDelayedExpansion
if %username% NEQ Administrator goto audit
echo ****************************** 
echo 已进入审核模式，请执行oobe.bat
echo ****************************** 
echo 请按任意键退出
pause>nul
exit
:audit
echo *****************  
echo 确认进入审核模式
echo ***************** 
echo 请按任意键进入
pause>nul
start %WINDIR%\system32\sysprep\sysprep.exe /audit /reboot
pause
