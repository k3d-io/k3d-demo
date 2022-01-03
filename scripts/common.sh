#!/bin/bash

RED='\033[1;31m'
GRN='\033[1;32m'
YEL='\033[1;33m'
BLU='\033[1;34m'
WHT='\033[1;37m'
MGT='\033[1;95m'
CYA='\033[1;96m'
END='\033[0m'
BLOCK='\033[1;37m'

PATH=/usr/local/bin:$PATH
export PATH

# wait for Enter key to be pressed
function pause(){
  read -rp "[Enter] Continue..."
}

# show info text and command, wait for enter, then execute and print a newline
function info_pause_exec() {
  step "$1"
  read -rp $'\033[1;37m#\033[0m'" Command: "$'\033[1;96m'"$2"$'\033[0m'" [Enter]"
  exe "$2"
  echo ""
}

# show info text and command, wait for chosen option
function info_pause_exec_options() {
  step "$1"

  read -p $'\033[1;37m#\033[0m'" Command: "$'\033[1;96m'"$2"$'\033[0m'" [y/n] > " -r -n 1 choice
  case "$choice" in 
    y|Y )
      echo ""
      exe "$2"
      echo ""
      return 0
      ;;
    n|N )
      echo ""
      echo "Not executed."
      return 0
      ;;
    * )
      echo ""
      echo "Invalid Choice. Type y or n."
      info_pause_exec_options "$1" "$2" # restart process on invalid choice
      ;;
  esac
  
}

# show command and execute it
exe() {
  echo "\$ $1"
  eval "$1"
}

# highlight a new section
section() {
  echo ""
  log "***** Section: ${MGT}$1${END} *****"; 
  echo ""
}

# highlight a new section but ask for confirmation to run it
proceed_or_not() {
  read -p $'\033[1;37m#\033[0m\033[1;33m'" Proceed with $1?"$'\033[0m'" [y/n] > " -r -n 1 choice
  case "$choice" in 
    y|Y )
      echo -e "\n"
      return 0
      ;;
    n|N )
      echo -e "\n"
      return 1
      ;;
    * )
      echo ""
      echo "Invalid Choice. Type y or n."
      proceed_or_not "$1" "$2" # restart process on invalid choice
      ;;
  esac
}

# highlight the next step
step() { log "Step: ${BLU}$1${END}"; }

# output a "log" line with bold leading >>>
log() { >&2 printf "${BLOCK}#${END} $1\n"; }
