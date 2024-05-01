apt update -y
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update \
	&& sudo apt install ngrok -y
ngrok config add-authtoken 2eTzTtisRPj4pnUlPB0p8kGKdMR_5QHLfQkLt8qeaTwFDRnRP 
apt install qemu-kvm -y
wget -O lao.iso "https://software-static.download.prss.microsoft.com/dbazure/988969d5-f34g-4e03-ac9d-1f9786c66749/17763.3650.221105-1748.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso"
qemu-img create -f qcow2 win8.img 128G
nohup ./ngrok tcp 5900 &>/dev/null &
qemu-system-x86_64 -hda win8.img -m 2G -boot d -cdrom "lao.iso" -smp cores=2 -cpu host -enable-kvm -vnc :0 -machine usb=on -device usb-tablet
