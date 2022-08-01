@echo off&setlocal EnableDelayedExpansion
rem del exclude Administrator
if %username% EQU Administrator goto oobe
echo *******************************
echo 不是审核模式，请先执行audit.bat
echo *******************************
rem echo 请按任意键结束
pause>nul
exit
:oobe
taskkill /im sysprep.exe
echo 正在删除用户...
net user
for /f "skip=4 tokens=1-3 delims= " %%a in ('net user') do (set /a n+=1
set U#!n!=%%a
set /a n+=1
set U#!n!=%%b
set /a n+=1
set U#!n!=%%c)
for /f "tokens=2 delims==" %%u in ('set u#') do (
if /i %%u NEQ Administrator net user %%u /delete&&echo %%u)
echo *******************************
echo 删除用户成功...
echo *******************************
echo 按任意键进入OOBE模式...
pause>nul
start %WINDIR%\system32\sysprep\sysprep.exe /oobe /shutdown
rem del %~nx0 rem 删除自身
