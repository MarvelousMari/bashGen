#!/bin/bash

# this script generates a new file adds a shebang then opens it in either atom or vim
# also catches improper uses
FILENAME=""
EDITOR=""

usage() {
  echo "FILENAME -a|-v "
  echo "FILENAME doesn't need .sh extension"
  echo "EDITOR options: "
  echo "	-a or --atom opens file in Atom text editor"
  echo "	-v or --vim opens file in Vim text editor"
}



#check to see if there are too many arguments provided

# TODO: Replace IF statement tree with while getops cmd loop

if [[ ${#} -gt 2 ]]
then
  usage
  exit 1
fi

# check for help
if [[ ${1} == "-h" || ${1} == "--help" ]]
then
  usage
  exit 0
# check for too few arguments
elif [[ ${#} -lt 2 ]]
then
  usage
else
  # set filename with the addition of .sh
  FILENAME="${1}.sh"
  shift
fi

#check if file exists and is not empty
if [[ -s ${PWD}/${FILENAME} ]]
then
  echo "File already exists"
  # loops till a valid Y/N response is given
  VALIDYN=false
  while [[ "${VALIDYN}" == false ]]
  do
  read -p "do you wish to open the file?[Y/N] " ANSWER
    if [[ "${ANSWER}" == "Y" || "${ANSWER}" == "y" ]]
    then
      VALIDYN=true
    elif [[ "${ANSWER}" == "N" || "${ANSWER}" == "n" ]]
    then
      VALIDYN=true
      echo "You've choosen not to open the file"
      exit 1
    fi
  done
else
  # TODO: FIX Double writing shabang in some cases
  #create file, add shabang, and make the file executeable
  touch "${FILENAME}"
  echo "#!/bin/bash">>${FILENAME}
  chmod 755 ${FILENAME}
fi

# find the editor to use
if [[ ${1} == "-a" || ${1} == "--atom" ]]
then
  atom ${FILENAME}
  # check to make sure this executed correctly
  if [[ ${?} == "1" ]]
  then
    echo "error when attempting to open ${FILENAME} with: ${EDITOR} as the editor argument"
    exit 1
  else
    exit 0
  fi
elif [[ ${1} == "-v" || ${1} == "--vim" ]]
then
  vim ${FILENAME}
  # check to make sure this executed correctly
  if [[ ${?} == "1" ]]
  then
    echo "error when attempting to open ${FILENAME} with: ${EDITOR} as the editor argument"
    exit 1
  else
    exit 0
  fi
else
  # catch bad editor argument
  echo "${1} is not a vaild editor option"
  usage
  exit 1
fi

exit 0
