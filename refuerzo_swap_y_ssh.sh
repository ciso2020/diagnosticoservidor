#!/bin/bash
echo "📦 Agregando 2GB de SWAP extra..."

fallocate -l 2G /swapfile2
chmod 600 /swapfile2
mkswap /swapfile2
swapon /swapfile2

echo '/swapfile2 none swap sw 0 0' >> /etc/fstab

echo "✅ SWAP extendido. Mostrando configuración:"
free -h

echo -e "\n🔁 Reiniciando servicios esenciales (sshd y systemd)..."
systemctl daemon-reexec
systemctl restart ssh

echo -e "\n🟢 Refuerzo completo. SSH debería estar más estable."
