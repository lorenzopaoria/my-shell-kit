cat << 'EOF' > ~/ripristina-batteria.sh
#!/bin/bash
# Script per rifirmare il driver dopo update del Kernel Fedora
KERNEL_VER=$(uname -r)
MOK_DIR="$HOME/.my_secure_keys"
TEMP_DIR="/tmp/acer-battery-build"

echo "--- Ripristino Driver Acer Battery per Kernel $KERNEL_VER ---"

# 1. Pulizia e Download
rm -rf $TEMP_DIR
git clone https://github.com/frederik-h/acer-wmi-battery.git $TEMP_DIR
cd $TEMP_DIR

# 2. Compila
make

# 3. Copia nel nuovo Kernel
sudo mkdir -p /lib/modules/$KERNEL_VER/extra/
sudo cp acer-wmi-battery.ko /lib/modules/$KERNEL_VER/extra/

# 4. Firma con la tua chiave .my_secure_keys
sudo /usr/src/kernels/$KERNEL_VER/scripts/sign-file sha256 $MOK_DIR/MOK.key $MOK_DIR/MOK.bin /lib/modules/$KERNEL_VER/extra/acer-wmi-battery.ko

# 5. Carica e Attiva
sudo depmod -a
sudo modprobe acer-wmi-battery
echo 1 | sudo tee /sys/bus/wmi/drivers/acer-wmi-battery/health_mode

echo "--- Ripristino completato! Prova a digitare 'bat-status' ---"
EOF

chmod +x ~/ripristina-batteria.sh
