@echo off
setlocal enabledelayedexpansion

echo ==== SETUP LANJUTAN PROYEK LARAVEL DI PERANGKAT BARU ====

:: Input GitHub repo
set /p GIT_URL=Masukkan URL GitHub proyek (misal: https://github.com/kamu/nama-repo.git):

:: Ambil nama folder dari URL
for %%f in (%GIT_URL%) do set "FOLDER=%%~nf"

:: Clone jika belum ada
if not exist "%FOLDER%\" (
    git clone %GIT_URL%
    echo ✔ Proyek berhasil di-clone ke folder: %FOLDER%
) else (
    echo ⚠ Folder "%FOLDER%" sudah ada. Melanjutkan pull...
    cd "%FOLDER%"
    git pull origin main
    goto lanjut
)

cd "%FOLDER%"

:lanjut

:: Jalankan composer install
if exist composer.json (
    echo 📦 Menjalankan composer install...
    composer install
    echo ✔ composer install selesai.
) else (
    echo ⚠ composer.json tidak ditemukan!
)

:: Salin .env jika belum ada
if not exist .env (
    copy .env.example .env
    echo ✔ File .env dibuat dari .env.example
)

:: Buat database otomatis
set /p BUAT_DB=Apakah ingin buat database otomatis? (y/n):
if /i "!BUAT_DB!"=="y" (
    set /p DB_NAME=Masukkan nama database lokal (misal: blogku_db):
    echo 🔧 Membuat database %DB_NAME%...

    :: Jalankan MySQL untuk buat DB (pastikan sudah install)
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS %DB_NAME%;" >nul 2>nul

    if !errorlevel! == 0 (
        echo ✔ Database %DB_NAME% berhasil dibuat.

        :: Update .env otomatis (mengganti DB_DATABASE=)
        powershell -Command "(Get-Content .env) -replace 'DB_DATABASE=.*', 'DB_DATABASE=%DB_NAME%' | Set-Content .env"
        echo ✔ .env diperbarui dengan DB_DATABASE=%DB_NAME%
    ) else (
        echo ⚠ Gagal membuat database. Cek MySQL atau izin akses.
    )
)

:: Generate app key Laravel
php artisan key:generate
echo ✔ Laravel APP_KEY berhasil dibuat

echo ==== SETUP SELESAI ====
pause
