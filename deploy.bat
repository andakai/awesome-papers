@echo off
call nvm use 12.22.12
call gitbook build
call git add .
for /f "tokens=2 delims==" %%A in ('wmic OS Get localdatetime /value') do set "currentTime=%%A"
set "currentTime=%currentTime:~0,4%-%currentTime:~4,2%-%currentTime:~6,2% %currentTime:~8,2%:%currentTime:~10,2%:%currentTime:~12,2%"
call git commit -m "Update: %currentTime%"
call git push
call nvm use 20.10.0