#!/bin/bash

# Membuat direktori untuk keyrings jika belum ada

echo -e "\033[34m𝗣𝗥𝗢𝗦𝗘𝗦, 𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗗𝗜𝗧𝗨𝗡𝗚𝗚𝗨\033[0m"
sudo mkdir -p /etc/apt/keyrings >

# Mengunduh dan menyimpan key GPG NodeSource
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Menambahkan repository NodeSource ke sources.list.d
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Memperbarui daftar paket dan menginstal Node.js
sudo apt update > /dev/null 2>&1
sudo apt install -y nodejs > /dev/null 2>&1

# Menginstal Yarn secara global
npm i -g yarn > /dev/null 2>&1

# Pindah ke direktori aplikasi dan membangun
cd /var/www/pterodactyl

# Menginstal dependensi dan membangun aplikasi
yarn > /dev/null 2>&1
echo -e "\033[34m𝗪𝗔𝗜𝗧 𝗜𝗡𝗜 𝗔𝗞𝗔𝗡 𝗦𝗘𝗗𝗜𝗞𝗜𝗧 𝗟𝗔𝗠𝗔\033[0m"
yarn build:production > /dev/null 2>&1
echo -e "\033[34m𝗕𝗘𝗥𝗛𝗔𝗦𝗜𝗟, 𝗖𝗢𝗕𝗔𝗟𝗔𝗛 𝗗𝗘𝗡𝗚𝗔𝗡  yarn\033[0m"
