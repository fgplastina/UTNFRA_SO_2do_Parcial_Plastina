#! /bin/bash

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <usuario> <archivo>"
    exit 1
fi

USER=$1
FILE=$2

PASSWORD=$(sudo grep $USER /etc/shadow | awk -F ':' '{print $2}')

echo $PASSWORD

echo $USER
if ! id "$USER" &>/dev/null; then
    echo "El usuario $USER no existe."
    exit 1
fi

while IFS=',' read -r NEW_USER NEW_GROUP HOME_DIR; do

    if [[ "$NEW_USER" =~ ^#.* ]]; then
        continue
    fi
    # Creates the group
    if ! getent group "$NEW_GROUP" &>/dev/null; then
        sudo groupadd "$NEW_GROUP"
        echo "Grupo $NEW_GROUP creado."
    else
        echo "El grupo $NEW_GROUP ya existe."
    fi


    # Creates the user
    if ! id "$NEW_USER" &>/dev/null; then
        echo "sudo useradd -m -d \"${HOME_DIR}\" -g \"${NEW_GROUP}\" -p \"${PASSWORD}\" \"${NEW_USER}\""
        sudo useradd -m -d "$HOME_DIR" -g "$NEW_GROUP" -p "$PASSWORD" "$NEW_USER"
        echo "Usuario $NEW_USER creado con home $HOME_DIR y asignado al grupo $NEW_GROUP."
    else
        echo "El usuario $NEW_USER ya existe."
    fi
done < "$FILE"

echo "Usuarios y grupos creados.."

# FUll commands list
touch PlastinaAltaUser-Group.sh
mv PlastinaAltaUser-Group.sh /usr/local/bin
v /usr/local/bin/PlastinaAltaUser-Group.sh 
chmod +x /usr/local/bin/PlastinaAltaUser-Group.sh 
/usr/local/bin/PlastinaAltaUser-Group.sh vagrant UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
ls /work/
sudo cat /etc/shadow
history >> RTA_Examen_20240627/Punto_B.sh 
