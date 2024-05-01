# Make Instance ready for rdp
apt update
apt install ubuntu-desktop -y
wget "https://download.nomachine.com/download/8.11/Linux/nomachine_8.11.3_4_amd64.deb"
chmod +x nomachine_8.11.3_4_amd64.deb
apt install ./nomachine_8.11.3_4_amd64.deb -y
apt install sudo -y
apt install lightdm -y
service lightdm start
#!/bin/bash
# Variabel-variabel
USERNAME="aji"
PASSWORD="123456"
HOME_DIR="/home/$USERNAME"
SHELL="/bin/bash"

# Menambahkan pengguna baru
adduser --disabled-password --gecos "" --home "$HOME_DIR" --shell "$SHELL" $USERNAME

# Mengatur password pengguna
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Opsional: Tambahkan pengguna ke grup tambahan
usermod -aG sudo,adm $USERNAME

# ngrok

curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| tee /etc/apt/sources.list.d/ngrok.list \
	&& apt update \
	&& apt install ngrok -y
ngrok config add-authtoken 2eTzTtisRPj4pnUlPB0p8kGKdMR_5QHLfQkLt8qeaTwFDRnRP
ngrok tcp --region ap 4000
