# Make Instance ready for rdp
apt update
apt-get install -y -qq openssh-server
apt install sudo -y
service ssh start
#!/bin/bash
# Variabel-variabel
USERNAME="aji"
PASSWORD="123456"
HOME_DIR="/home/$USERNAME"
SHELL="/bin/bash"

# Menambahkan pengguna baru
adduser --disabled-password --gecos "" --home "$HOME_DIR" --shell "$SHELL" --groups sudo,adm $USERNAME

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
ngrok tcp --region ap 22
