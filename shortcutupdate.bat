@echo off
setlocal enabledelayedexpansion

echo ==== GIT PUSH OTOMATIS ====

:: Cek apakah folder git
if not exist .git (
    echo ❌ Ini bukan folder Git. Pastikan sudah git init & connect remote.
    pause
    exit /b
)

:: Tampilkan status perubahan
echo.
echo 💡 Status Git:
git status
echo.

:: Tambahkan semua perubahan
echo ➕ Menambahkan semua perubahan...
git add .

:: Minta pesan commit dari user
set /p MESSAGE=📝 Masukkan pesan commit (tanpa tanda kutip): 

:: Commit perubahan
git commit -m "%MESSAGE%"

:: Push ke GitHub
echo 🚀 Melakukan push ke GitHub...
git push origin main

echo.
echo ✅ PUSH SELESAI!
pause
