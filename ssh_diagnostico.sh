#!/bin/bash

echo "========== 🔍 DIAGNÓSTICO DE SSH =========="

# 1. Estado del servicio SSH
echo -e "\n🔹 Estado del servicio SSH:"
systemctl status ssh | head -n 15

# 2. ¿SSH está habilitado para arrancar solo?
echo -e "\n🔹 SSH habilitado al inicio:"
systemctl is-enabled ssh

# 3. Últimos errores del servicio SSH
echo -e "\n🔹 Últimos 30 errores del servicio SSH:"
journalctl -u ssh --no-pager | tail -n 30

# 4. Firewall: UFW o iptables
echo -e "\n🔹 Estado del firewall (UFW):"
ufw status verbose

echo -e "\n🔹 Reglas activas en iptables:"
iptables -L -n

# 5. Procesos activos y uso de recursos
echo -e "\n🔹 Top procesos (ordenados por uso de CPU):"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10

# 6. Uso de memoria y swap
echo -e "\n🔹 Uso de memoria y swap:"
free -h

echo -e "\n✅ Diagnóstico completo."
