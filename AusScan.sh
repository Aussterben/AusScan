#!/bin/bash

##############################################
#            Script By Aussterben            #
##############################################

# Recuerda dar permisos de ejecución con "chmod +x AusScan.sh"

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
      echo -e "${yellowColour}[+]${endColour}${grayColour} Panel de Uso${endColour}"
      echo -e "${yellowColour}[+]${endColour}${grayColour} Redes:${endColour}"
      echo -e "\n\t${blueColour}-ap)${endColour}${grayColour} [All Ports] Escanea todos los puertos de una IP${endColour}"
      echo -e "\t${blueColour}-p)${endColour}${grayColour} [Port] Escanea un único puerto${endColour}"
      echo -e "\t${blueColour}-ips)${endColour}${grayColour} [Ips] Escanea todas las IPs activas en la '192.168.0.x'${endColour}"
      echo -e "\t${blueColour}-ip)${endColour}${grayColour} [Ip] Escanea una IP elegida por el usuario en la red${endColour}"
      echo -e "\t${blueColour}--aips)${endColour}${grayColour} [All Ips] Escanea todas las IPs activas en la '192.168.x.x'${endColour}"
      echo -e "\n-------------------------------------------------------------------------------------------------\n"
      echo -e "${yellowColour}[+]${endColour}${grayColour} Fuzzing:${endColour}"
      echo -e "\t${blueColour}-w <wordlist> -u <url>${endColour}${grayColour} Hace fuzzing sobre una URL usando una wordlist${endColour}"
      echo -e "\t${grayColour}    La URL debe contener la palabra FUZZ como marcador, ej: http://ejemplo.com/FUZZ${endColour}"
      echo -e "\t${blueColour}-c <códigos>${endColour}${grayColour} Filtra los resultados por código(s) de estado, ej: -c 200,301,403${endColour}"
      echo -e "\t${grayColour}    Si no se indica, se muestra todo excepto los 404${endColour}"
      echo -e "\n${redColour}[+] Version 2.2${endColour}"
  esac
}

# Función de fuzzing: admite -w <wordlist> y -u <url> combinados en cualquier orden
fuzz(){
  local WORDLIST=""
  local URL=""
  local CODES=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -w)
        # Comprueba que exista un valor después de -w y que no sea otro flag ni esté vacío
        if [[ -z "$2" || "$2" == -* ]]; then
          echo -e "\n${redColour}[!] La opción -w requiere un valor (ruta de la wordlist) y no puede estar vacío${endColour}\n"
          exit 1
        fi
        WORDLIST="$2"
        shift 2
        ;;
      -u)
        # Comprueba que exista un valor después de -u y que no sea otro flag ni esté vacío
        if [[ -z "$2" || "$2" == -* ]]; then
          echo -e "\n${redColour}[!] La opción -u requiere un valor (URL) y no puede estar vacío${endColour}\n"
          exit 1
        fi
        URL="$2"
        shift 2
        ;;
      -c)
        # Comprueba que exista un valor después de -c y que no sea otro flag ni esté vacío
        if [[ -z "$2" || "$2" == -* ]]; then
          echo -e "\n${redColour}[!] La opción -c requiere un valor (código o códigos de estado) y no puede estar vacío${endColour}\n"
          exit 1
        fi
        # Solo se permiten dígitos y comas, ej: 200 o 200,301,403
        if [[ ! "$2" =~ ^[0-9]+(,[0-9]+)*$ ]]; then
          echo -e "\n${redColour}[!] La opción -c solo admite números separados por comas, ej: -c 200,301,403${endColour}\n"
          exit 1
        fi
        CODES="$2"
        shift 2
        ;;
      *)
        echo -e "\n${redColour}[!] Opción no reconocida: $1${endColour}\n"
        shift
        ;;
    esac
  done

  # Doble comprobación por si -w/-u nunca se indicaron en absoluto
  if [[ -z "$WORDLIST" ]]; then
    echo -e "\n${redColour}[!] Falta indicar -w <wordlist>${endColour}\n"
    exit 1
  fi

  if [[ -z "$URL" ]]; then
    echo -e "\n${redColour}[!] Falta indicar -u <url>${endColour}\n"
    exit 1
  fi

  if [[ ! -f "$WORDLIST" ]]; then
    echo -e "\n${redColour}[!] No se encontró el archivo: $WORDLIST${endColour}\n"
    exit 1
  fi

  if [[ "$URL" != *FUZZ* ]]; then
    echo -e "\n${redColour}[!] La URL debe contener la palabra FUZZ como marcador (ej: http://ejemplo.com/FUZZ)${endColour}\n"
    exit 1
  fi

  tput civis
  if [[ -n "$CODES" ]]; then
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Iniciando fuzzing en $URL usando $WORDLIST (filtrando por código: $CODES)${endColour}\n"
  else
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Iniciando fuzzing en $URL usando $WORDLIST${endColour}\n"
  fi

  # Convierte "200,301,403" en un array (200 301 403) para comparar fácil
  IFS=',' read -ra CODE_LIST <<< "$CODES"

  while IFS= read -r word; do
    [[ -z "$word" ]] && continue

    target="${URL//FUZZ/$word}"
    status=$(curl -s -o /dev/null -w "%{http_code}" "$target")

    if [[ -n "$CODES" ]]; then
      # Modo filtro explícito: solo muestra si el código está en la lista indicada
      for code in "${CODE_LIST[@]}"; do
        if [[ "$status" == "$code" ]]; then
          echo -e "${greenColour}[+] [$status] $target${endColour}"
          break
        fi
      done
    else
      # Comportamiento por defecto: muestra todo menos 404
      if [[ "$status" != "404" ]]; then
        echo -e "${greenColour}[+] [$status] $target${endColour}"
      fi
    fi
  done < "$WORDLIST"

  tput cnorm
}

# Recuperamos el cursor
tput cnorm

# Dispatcher: si el primer argumento es -w o -u, entramos en modo fuzzing
# y pasamos TODOS los argumentos, para poder combinarlos (-w x -u y).
# Cualquier otra cosa, se mantiene el comportamiento original de menú.
case "$1" in
  -w|-u|-c)
    fuzz "$@"
    ;;
  *)
    opciones "$1"
    ;;
esac
