#!/bin/bash

cmake -B /tmp/build .

cmake --build /tmp/build

sudo cp /tmp/build/fanWatch /usr/local/bin/

sudo mkdir -p /usr/local/lib/systemd/system/

cd /usr/local/lib/systemd/system/

echo "[Unit]
Description=notification of heat CPU

[Service]
Type=simple
ExecStart=/usr/local/bin/fanWatch
Restart=always"| sudo tee fanWatch.service

sudo systemctl daemon-reload

sudo systemctl start fanWatch

sudo systemctl status fanWatch
