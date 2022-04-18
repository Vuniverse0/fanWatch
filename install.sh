#!/bin/bash

cmake -B /bin/fanWatch/build .

cmake --build /bin/fanWatch/build

sudo mkdir -p /usr/local/lib/systemd/system/

cd /usr/local/lib/systemd/system/

echo "[Unit]
Description=notification of heat CPU

[Service]
Type=simple
ExecStart=/bin/fanWatch/fanWatch
Restart=always"| sudo tee fanWatch.service

sudo systemctl daemon-reload

sudo systemctl start fanWatch

sudo systemctl status fanWatch
