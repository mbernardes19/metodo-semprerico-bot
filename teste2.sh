#!/bin/bash

pm2 stop app
cd apps_nodejs
rm -rf metodo-semprerico-bot
git clone https://github.com/mbernardes19/metodo-semprerico-bot.git
cd metodo-semprerico-bot
npm install
pm2 start src/app.js