#! /bin/bash

# Crear particiones
# sudo fdisk /dev/sdd
# n
# p
# *Enter* num de particion
# *Enter* <- toma valor default
# +512M <- agrega particion de 5M
# t
# 2 <- si hay una sola particion no es necesario
# 8e
# w

# sdc1 1.5G
# sdd1 512M
# sdd2 5M

#
#└─sdc1                          8:33   0  1.5G  0 part
#  └─vg_workareas-lv_workareas 253:1    0  1.5G  0 lvm  /work
#sdd                             8:48   0    1G  0 disk
#├─sdd1                          8:49   0    5M  0 part
#└─sdd2                          8:50   0  512M  0 part


sudo wipefs -a /dev/sdc1
sudo wipefs -a /dev/sdd1
sudo wipefs -a /dev/sdd2

sudo pvcreate /dev/sdc1
sudo pvcreate /dev/sdd1
sudo pvcreate /dev/sdd2

sudo vgcreate vg_workareas /dev/sdc1 #1.5G
sudo vgcreate vg_temp /dev/sdd2 # 5M
sudo vgcreate vg_datos /dev/sdd1 # 512M

sudo lvcreate -l +100%FREE  vg_datos -n lv_datos #
sudo lvcreate -l +100%FREE  vg_workareas -n lv_workareas #1.5G
sudo lvcreate -l +100%FREE  vg_temp -n lv_temp # 5M

sudo mkfs.ext4 /dev/mapper/vg_datos-lv_datos
sudo mkfs.ext4 /dev/mapper/vg_workareas-lv_workareas
#sudo mkfs.ext4 /dev/mapper/vg_temp-lv_temp

# Swap
sudo mkswap /dev/mapper/vg_temp-lv_temp
sudo swapon /dev/mapper/vg_temp-lv_temp

sudo mount /dev/mapper/vg_datos-lv_datos /var/lib/docker
sudo mount /dev/mapper/vg_workareas-lv_workareas /work/
#sudo mount /dev/mapper/vg_temp-lv_temp # Memoria swap


# Full commands
chown +x foo/prepare.sh 
chmod +x foo/prepare.sh 
./foo/prepare.sh 
ssh-keygen -t ed25519 -C "your_email@example.com"
cat .ssh/id_ed25519.pub 
ssh -T git@github.com
git clone git@github.com:upszot/UTN-FRA_SO_Examenes.git
ls
rm -rf UTN-FRA_SO_Examenes/
git clone git@github.com:upszot/UTN-FRA_SO_Examenes.git
./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
source ~/.bashrc
v RTA_Examen_20240627/
chmod +x RTA_Examen_20240627/Punto_A.sh 
lsblk 
sudo fdisk /dev/sdc 
sudo fdisk /dev/sdd
lsblk 
v RTA_Examen_20240627/Punto_
v RTA_Examen_20240627/Punto_A.sh 
chmod +x RTA_Examen_20240627/Punto_A.sh 
./RTA_Examen_20240627/Punto_A.sh 
lsblk 
cat RTA_Examen_20240627/Punto_A.sh 
sudo swapoff /dev/mapper/vg_temp-lv_temp
lsblk 
sudo umount /var/lib/docker 
v RTA_Examen_20240627/Punto_A.sh 
lsblk 
cat RTA_Examen_20240627/Punto_A.sh 
sudo lvremove /dev/mapper/vg_datos-lv_datos
sudo vvremove vg_datos
sudo vgremove vg_datos
sudo pvremove vg_datos
sudo lvremove /dev/mapper/vg_temp-lv_temp
sudo pvremove vg_temp
sudo pvremove vg_datos
sudo vgremove vg_datos
sudo vgremove vg_temp
clear
ls
sudo ./RTA_Examen_20240627/Punto_A.sh 
lsblk 
sudo umount /var/lib/docker 
sudo swapoff /dev/mapper/vg_temp-lv_temp
sudo lvremove /dev/mapper/vg_temp-lv_temp
sudo pvremove vg_temp
sudo vgremove vg_temp
sudo lvremove /dev/mapper/vg_temp-lv_temp
sudo lvremove /dev/mapper/vg_datos-lv_datos
sudo vgremove vg_datos
lsblk 
v RTA_Examen_20240627/Punto_A.sh 
./RTA_Examen_20240627/Punto_A.sh 
lsblk 
history >> RTA_Examen_20240627/Punto_A.sh 
