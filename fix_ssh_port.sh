#!/bin/bash
echo "🔧 Corrigiendo configuración SSH para puerto 22 en todas las interfaces..."

sed -i 's/^Port .*/Port 22/' /etc/ssh/sshd_config
sed -i 's/^ListenAddress .*/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config

grep -q '^Port' /etc/ssh/sshd_config || echo 'Port 22' >> /etc/ssh/sshd_config
grep -q '^ListenAddress' /etc/ssh/sshd_config || echo 'ListenAddress 0.0.0.0' >> /etc/ssh/sshd_config

systemctl restart ssh

echo "✅ SSH restaurado. Revisá con: sudo netstat -tuln | grep :22"
