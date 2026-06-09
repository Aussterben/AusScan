#!/bin/bash

##############################################
#            Script By Aussterben            #
##############################################

# Recuerda dar permisos de ejecución con "chmod +x filter.sh"

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Lo primero que se ve tras ejecutar el script

clear
echo -e """
${redColour}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣟⣀⣽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠈⣿⠁⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣟⣋⡇⠀⠀⠀⠀⠀⢀⠟⡄⠀⠀⠀⠀⠀⣾⣯⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⠴⡄⠀⠀⠀⠀⠀⠀⠈⣿⡀⠀⠀⠀⠀⠀⡸⠀⢧⠀⠀⠀⠀⠀⢀⣏⠁⠀⠀⠀⠀⠀⠀⣠⣦⡄
⠘⠓⠻⣤⡀⠀⠀⠀⠀⠀⡏⢣⠀⠀⠀⠀⢀⠇⠀⠸⡄⠀⠀⠀⠀⡜⢸⠀⠀⠀⠀⠀⠀⣠⡾⠟⠃
⠀⠀⠀⢣⠙⠦⡀⠀⠀⢠⠃⠈⢇⠀⠀⠀⡞⠀⠀⠀⢣⠀⠀⠀⡼⠁⢸⡄⠀⠀⢀⡴⠊⡞⠀⠀⠀
⠀⠀⠀⠈⡆⠀⠙⢦⠀⠸⠀⠀⠈⢆⠀⢰⠁⠀⠀⠀⠈⣇⠀⡰⠁⠀⠈⣇⠀⡰⠋⠀⢰⠀⠀⠀⠀
⠀⠀⠀⠀⢁⠀⠀⠀⠱⡇⠀⠀⠀⠈⢦⠇⠀⠀⠀⠀⠀⠘⡶⠁⠀⠀⠀⢸⠞⠀⠀⠀⡾⠀⠀⠀⠀
⠀⠀⠀⠀⢸⠀⠀⢀⣀⣀⣀⣤⣤⣤⣴⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣀⣀⣀⣀⠀⠀⠀⡇⠀⠀⠀⠀
⠀⠀⠀⠀⣼⠶⢿⣟⠛⠉⠉⢩⡟⢧⠀⠀⠀⣴⠛⣦⠀⠀⢠⠞⢫⡉⠉⠙⢛⡟⠿⠶⡷⠀⠀⠀⠀
⠀⠀⠀⠀⠹⡄⠸⣽⣃⣀⣀⣈⣿⣯⣤⣤⣤⣬⣾⣥⣤⣤⣬⣷⣯⣀⣀⣀⣻⡼⠀⢰⠃⠀⠀⠀⠀
⠀⠀⠀⠀⢼⠗⠛⠋⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠛⠛⢻⡦⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠉⠑⠒⠒⠂⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠒⠒⠒⠊⠉⠁
${endColour}
"""

echo -e "\n${redColour}[+]${endColour}${grayColour} Script by Aussterben${endColour}\n"

function ctrl_c(){
  echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
  tput cnorm; exit 1
}

#ctrl+c 
trap ctrl_c INT

opciones(){
  case $1 in 
    -ap)
      read -p "[+] Indica una IP: " ip
      timeout 2 ping -c 1 $ip &>/dev/null
      if [ ! $? -eq 124 ]; then
        tput civis # Ocultar el cursor
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Comenzando la búsqueda de puertos${endColour}\n"
        for port in $(seq 1 65535); do
          (echo '' > /dev/tcp/$ip/$port) 2>/dev/null && echo -e "${greenColour}[+] $port - OPEN${endColour}" &
        done
      elif [ "$ip" = "127.0.0.1" ] && [ ! $? -eq 124 ]; then
        tput civis
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Comenzando la búsqueda de puertos${endColour}\n"
        for port in $(seq 1 65535); do
          (echo '' > /dev/tcp/$ip/$port) 2>/dev/null && echo -e "${greenColour}[+] $port - OPEN${endColour}" &
        done
      elif [ "$ip" = "localhost" ] && [ ! $? -eq 124 ]; then
        tput civis
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Comenzando la búsqueda de puertos${endColour}\n"
        for port in $(seq 1 65535); do
          (echo '' > /dev/tcp/$ip/$port) 2>/dev/null && echo -e "${greenColour}[+] $port - OPEN${endColour}" &
        done
      else 
        echo -e "\n${redColour}[!] Ha ocurrido un error${endColour}\n"
        exit 1
      fi
      ;;
    -p)
      read -p "[+] Indica una IP: " ip2
      timeout 2 ping -c 1 $ip2 &>/dev/null
      if [ ! $? -eq 124 ]; then
        read -p "[+] Indica el puerto: " uniqport
        tput civis # Ocultar el cursor
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Descubriendo si el puerto está abierto${endColour}\n"
        (echo '' > /dev/tcp/$ip2/$uniqport) 2>/dev/null && echo -e "${greenColour}[+] $uniqport - OPEN${endColour}" || echo -e "${redColour}[-] El puerto está cerrado${endColour}" &
        tput cnorm
      elif [ "$ip2" = "127.0.0.1" ] && [ ! $? -eq 124 ]; then
        read -p "[+] Indica el puerto: " uniqport
        tput civis
      	echo -e "\n${yellowColour}[+]${endColour}${grayColour} Descubriendo si el puerto está abierto${endColour}\n"
        (echo '' > /dev/tcp/$ip2/$uniqport) 2>/dev/null && echo -e "${greenColour}[+] $uniqport - OPEN${endColour}" || echo -e "${redColour}[-] El puerto está cerrado${endColour}" &
        tput cnorm
      elif [ "$ip2" = "localhost" ] && [ ! $? -eq 124 ]; then
        read -p "[+] Indica el puerto: " uniqport
        tput civis
      	echo -e "\n${yellowColour}[+]${endColour}${grayColour} Descubriendo si el puerto está abierto${endColour}\n"
        (echo '' > /dev/tcp/$ip2/$uniqport) 2>/dev/null && echo -e "${greenColour}[+] $uniqport - OPEN${endColour}" || echo -e "${redColour}[-] El puerto está cerrado${endColour}" &
        tput cnorm
      else
        echo -e "\n${redColour}[!] Ha ocurrido un error${endColour}\n"
        exit 1
        tput cnorm
      fi
      ;;
    -ips)
      tput civis
      echo -e "\n${yellowColour}[+]${endColour}${grayColour} Descubriendo IPs activas${endColour}\n"
      for ip3 in $(seq 1 255); do
        timeout 2 bash -c "ping -c 1 192.168.0.$ip3 &>/dev/null" && echo -e "${greenColour}[+] 192.168.0.$ip3 activa${endColour}" &
      done
      sleep 2
      tput cnorm
      ;;
    -ip)
      read -p "[+] Indica la IP que quieres descubrir: " ip4
      tput civis
      echo -e "\n${yellowColour}[+]${endColour}${grayColour} Descubriendo si la IP está activa${endColour}\n"
      timeout 2 bash -c "ping -c 1 $ip4 &>/dev/null" && echo -e "${greenColour}[+] $ip4 activa${endColour}" || echo -e "${redColour}[-] La IP no está activa${endColour}" &
      sleep 2
      tput cnorm
      ;;
    --aips)
      tput civis
      echo -e "\n${yellowColour}[+]${endColour}${grayColour} Descubriendo IPs activas${endColour}\n"
      for first in $(seq 1 255); do
        for second in $(seq 1 255); do
          timeout 2 bash -c "ping -c 1 192.168.$first.$second &>/dev/null" && echo -e "${greenColour}[+] 192.168.$first.$second activa${endColour}" &
        done
      done
      wait
      tput cnorm
      ;;
    *)
      echo -e "${yellowColour}[+]${endColour}${grayColour} Panel de Uso:${endColour}"
      echo -e "\n\t${blueColour}-ap)${endColour}${grayColour} [All Ports] Escanea todos los puertos de una IP${endColour}"
      echo -e "\t${blueColour}-p)${endColour}${grayColour} [Port] Escanea un único puerto${endColour}"
      echo -e "\t${blueColour}-ips)${endColour}${grayColour} [Ips] Escanea todas las IPs activas en la '192.168.0.x'${endColour}"
      echo -e "\t${blueColour}-ip)${endColour}${grayColour} [Ip] Escanea una IP elegida por el usuario en la red${endColour}"
      echo -e "\t${blueColour}--aips)${endColour}${grayColour} [All Ips] Escanea todas las IPs activas en la '192.168.x.x'${endColour}"
      echo -e "\n${redColour}[+] Version 1.0${endColour}"
  esac
}
# Recuperamos el cursor
tput cnorm

opciones $1
