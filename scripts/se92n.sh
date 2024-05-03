# Make Instance ready for rdp
apt update
apt-get install -y -qq qemu-kvm
apt install sudo -y
wget -O win.iso https://dl.malwarewatch.org/windows/Windows-10-1607.iso

# ngrok
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| tee /etc/apt/sources.list.d/ngrok.list \
	&& apt update \
	&& apt install ngrok -y
ngrok config add-authtoken 2eTzTtisRPj4pnUlPB0p8kGKdMR_5QHLfQkLt8qeaTwFDRnRP
ngrok tcp --region ap 5900 &>/dev/null &
qemu-img create -f qcow2 win8.img 128G
qemu-system-x86_64 -hda win8.img -m 2G -boot d -cdrom "win.iso" -smp cores=2 -cpu host -enable-kvm -vnc :0 -machine usb=on -device usb-tablet &>/dev/null &
seq 1 43200 | while read i; do echo -en "\r Running .     $i s /43200 s";sleep 0.1;echo -en "\r Running ..    $i s /43200 s";sleep 0.1;echo -en "\r Running ...   $i s /43200 s";sleep 0.1;echo -en "\r Running ....  $i s /43200 s";sleep 0.1;echo -en "\r Running ..... $i s /43200 s";sleep 0.1;echo -en "\r Running     . $i s /43200 s";sleep 0.1;echo -en "\r Running  .... $i s /43200 s";sleep 0.1;echo -en "\r Running   ... $i s /43200 s";sleep 0.1;echo -en "\r Running    .. $i s /43200 s";sleep 0.1;echo -en "\r Running     . $i s /43200 s";sleep 0.1; done
