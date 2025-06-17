@echo off
setlocal enabledelayedexpansion

echo ==== SETUP OTOMATIS PROYEK LARAVEL + GIT ====

:: Input Git user
set /p GIT_NAME=Masukkan Nama Git Anda:
set /p GIT_EMAIL=Masukkan Email Git Anda:

:: Set konfigurasi Git global
git config --global user.name "%GIT_NAME%"
git config --global user.email "%GIT_EMAIL%"
echo ✔ Git config global diset.

:: Input apakah ingin clone Laravel dari repo
set /p CLONE_REPO=Ingin clone proyek Laravel dari GitHub? (y/n):
if /i "%CLONE_REPO%"=="y" (
    set /p CLONE_URL=Masukkan URL GitHub untuk di-clone:
    git clone "%CLONE_URL%"
    for /f "tokens=*" %%a in ('basename "%CLONE_URL%" .git') do set "REPO_DIR=%%~na"
    set "REPO_DIR=%CLONE_URL%"
    for %%f in (%CLONE_URL%) do set "REPO_DIR=%%~nf"
    cd "!REPO_DIR!" || exit /b
    echo ✔ Repo berhasil di-clone dan masuk folder.
) else (
    set /p REPO_DIR=Masukkan Nama Folder Proyek Baru:
    mkdir "%REPO_DIR%"
    cd "%REPO_DIR%" || exit /b
    echo ✔ Folder proyek dibuat dan dibuka.
)

:: Inisialisasi Git jika belum ada
if not exist .git (
    git init
    echo ✔ Git diinisialisasi.
)

:: Buat README.md
echo # %REPO_DIR% > README.md
echo ✔ README.md dibuat.

:: Buat .gitignore Laravel
(
echo /vendor/
echo /node_modules/
echo .env
echo storage/*.key
echo .idea/
echo .vscode/
echo /public/storage
echo storage/debugbar
) > .gitignore
echo ✔ .gitignore Laravel dibuat.

:: Buat .env kosong jika belum ada
if not exist .env (
    type nul > .env
    echo ✔ File .env kosong dibuat.
)

:: Jalankan composer install jika tersedia
if exist composer.json (
    echo Menjalankan composer install...
    composer install
    echo ✔ composer install selesai.
) else (
    echo ⚠ composer.json tidak ditemukan, skip install dependensi.
)

:: Git add dan commit awal
git add .
git commit -m "Initial Laravel commit with setup files"
echo ✔ Commit awal selesai.

:: Tambah remote dan push (opsional)
set /p REMOTE_URL=Masukkan URL Remote GitHub (kosongkan jika tidak ingin push):
if not "%REMOTE_URL%"=="" (
    git remote add origin %REMOTE_URL%
    git branch -M main
    git push -u origin main
    echo ✔ Remote ditambahkan dan push ke GitHub berhasil.
) else (
    echo ⚠ Tidak ada remote yang ditambahkan.
)

echo ==== SEMUA SELESAI! ====
pause
