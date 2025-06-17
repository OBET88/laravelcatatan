@echo off
echo Menyimpan perubahan...
git add .
set /p message="Pesan commit: "
git commit -m "%message%"
git push origin main
pause