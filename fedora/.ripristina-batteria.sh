#!/bin/bash
# Script per rifirmare il driver Acer Battery su Kernel $(uname -r)
KERNEL_VER=$(uname -r)
MOK_DIR="$HOME/.my_secure_keys"
TEMP_DIR="/tmp/acer-battery-build"

echo -e "\e[1;34m── $(date +%H:%M:%S) - Ripristino Driver Acer Battery ──────────────────\e[0m"

# 1. Installazione dipendenze necessarie per il nuovo kernel
sudo dnf install -y kernel-devel-$KERNEL_VER kernel-headers-$KERNEL_VER make gcc git

# 2. Download e Compilazione
rm -rf $TEMP_DIR
git clone https://github.com/frederik-h/acer-wmi-battery.git $TEMP_DIR
cd $TEMP_DIR && make

# 3. Installazione e Firma con MOK (Utilizzando le chiavi akmods di sistema)
sudo mkdir -p /lib/modules/$KERNEL_VER/extra/
sudo cp acer-wmi-battery.ko /lib/modules/$KERNEL_VER/extra/
sudo /usr/src/kernels/$KERNEL_VER/scripts/sign-file sha256 /etc/pki/akmods/private/private_key.priv /etc/pki/akmods/certs/public_key.der /lib/modules/$KERNEL_VER/extra/acer-wmi-battery.ko

# 4. Caricamento Modulo
sudo depmod -a
sudo modprobe acer-wmi-battery

# 5. Attivazione limite 80%
echo 1 | sudo tee /sys/bus/wmi/drivers/acer-wmi-battery/health_mode

echo -e "\e[1;32m✔ Driver ripristinato e limite 80% attivo per $KERNEL_VER\e[0m"
