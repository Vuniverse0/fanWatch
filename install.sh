#!/bin/bash

cd /bin/fanWatch

git clone git@github.com:Vuniverse0/fanWatch.git

cmake -B build .

cmake --build build

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
