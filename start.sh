#!/bin/bash

# Invoke the Forever module (to START our Node.js server).
./node_modules/forever/bin/forever \
    start \
    -al forever.log \
    -ao out.log \
    -ae err.log \
    app.js

sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 9000

# sudo node ./node_modules/nodemon/bin/nodemon