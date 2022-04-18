sudo mkdir -p /usr/local/lib/systemd/system/

cd /usr/local/lib/systemd/system/

echo "[Unit]
Description=notification of heat CPU

[Service]
Type=simple
ExecStart=/home/username/fanWatch/fanWatch
Restart=always"| sudo tee fanWatch.service
