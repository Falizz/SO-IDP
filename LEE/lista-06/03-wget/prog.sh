#!/bin/bash

python3 -c 'import socket; s=socket.socket(); s.bind(("", 8080)); s.listen(1); print("Aguardando..."); c,a=s.accept(); print(c.recv(1024).decode())' &
wget --post-file=/desafio/recompensa.txt http://localhost:8080