#!/bin/bash

echo
echo "test1: F"
./bashGen.sh test1
if [[ "${?}" == "1" ]]
then
  echo "FAILED test1"
  echo "./bashGen.sh test1"
else
  echo "TRUE"
fi

echo

echo
echo "test2: F"
./bashGen.sh test2 -
if [[ "${?}" == "1" ]]
then
  echo "FAILED test2"
  echo "./bashGen.sh test2 -"
else
  echo "TRUE"
fi

echo

echo
echo "test3: T"
./bashGen.sh test3 -a
if [[ "${?}" == "1" ]]
then
  echo "FAILED test3"
  echo "./bashGen.sh test3 -a"
else
  echo "TRUE"
fi

echo

echo
echo "test4: T"
./bashGen.sh test4 -v
if [[ "${?}" == "1" ]]
then
  echo "FAILED test4"
  echo "./bashGen.sh test4 -v"
else
  echo "TRUE"
fi

echo

echo
echo "test5: F"
./bashGen.sh test5 - -
if [[ "${?}" == "1" ]]
then
  echo "FAILED test5"
  echo "./bashGen.sh test5 - -"
else
  echo "TRUE"
fi

echo

echo
echo "test6: T/F"
touch test6.sh
echo "test6">>test6.sh
./bashGen.sh test6 -v
if [[ "${?}" == "1" ]]
then
  echo "FAILED test6"
  echo "touch test6.sh \
    echo \"test6\">>test6.sh\
        ./bashGen.sh test6 -v"
else
  echo "TRUE"
fi

echo

echo
echo "test7: T/F"
touch test7.sh
echo "test7">>test7.sh
./bashGen.sh test7 -a
if [[ "${?}" == "1" ]]
then
  echo "FAILED test7"
  echo "touch test7.sh \
    echo \"test6\">>test6.sh\
        ./bashGen.sh test7 -a"
else
  echo "TRUE"
fi

echo

echo
echo "test8: T"
./bashGen.sh -h
if [[ "${?}" == "1" ]]
then
  echo "FAILED test8"
  echo "./bashGen.sh -h"
else
  echo "TRUE"
fi

echo

echo
echo "test9: T"
./bashGen.sh --help
if [[ "${?}" == "1" ]]
then
  echo "FAILED test9"
  echo "./bashGen.sh --help"
else
  echo "TRUE"
fi

echo

echo
echo "test10: F"
./bashGen.sh
if [[ "${?}" == "1" ]]
then
  echo "FAILED test10"
  echo "./bashGen.sh"
else
  echo "TRUE"
fi

echo

for (( i = 1; i<11; i++ ));
do
  rm "test${i}.sh"
  if [[ "${?}" == "1" ]]
  then
    echo "couldn't delete test${i}.sh"
  fi
done
exit 0
