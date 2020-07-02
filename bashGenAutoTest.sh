#!/bin/bash

# remove any old logs
rm bashGen.log

echo
echo "test1: F" >> bashGen.log
./bashGen.sh test1
if [[ "${?}" == "1" ]]
then
  echo "FAILED test1" >> bashGen.log
  echo "./bashGen.sh test1" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

echo
echo "test2: F" >> bashGen.log
./bashGen.sh test2 -
if [[ "${?}" == "1" ]]
then
  echo "FAILED test2" >> bashGen.log
  echo "./bashGen.sh test2 -" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

echo
echo "test3: T" >> bashGen.log
./bashGen.sh test3 -a
if [[ "${?}" == "1" ]]
then
  echo "FAILED test3" >> bashGen.log
  echo "./bashGen.sh test3 -a" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

echo
echo "test4: T" >> bashGen.log
./bashGen.sh test4 -v
if [[ "${?}" == "1" ]]
then
  echo "FAILED test4" >> bashGen.log
  echo "./bashGen.sh test4 -v" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

echo
echo "test5: F" >> bashGen.log
./bashGen.sh test5 - -
if [[ "${?}" == "1" ]]
then
  echo "FAILED test5" >> bashGen.log
  echo "./bashGen.sh test5 - -" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

echo
echo "test6: T/F" >> bashGen.log
touch test6.sh
echo "test6">>test6.sh
./bashGen.sh test6 -v
if [[ "${?}" == "1" ]]
then
  echo "FAILED test6" >> bashGen.log
  echo "touch test6.sh \
    echo \"test6\">>test6.sh\
        ./bashGen.sh test6 -v" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

echo
echo "test7: T/F" >> bashGen.log
touch test7.sh
echo "test7">>test7.sh
./bashGen.sh test7 -a
if [[ "${?}" == "1" ]]
then
  echo "FAILED test7" >> bashGen.log
  echo "touch test7.sh \
    echo \"test6\">>test6.sh\
        ./bashGen.sh test7 -a" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

echo
echo "test8: T" >> bashGen.log
./bashGen.sh -h
if [[ "${?}" == "1" ]]
then
  echo "FAILED test8" >> bashGen.log
  echo "./bashGen.sh -h" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

echo
echo "test9: T" >> bashGen.log
./bashGen.sh --help
if [[ "${?}" == "1" ]]
then
  echo "FAILED test9" >> bashGen.log
  echo "./bashGen.sh --help" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

echo
echo "test10: F" >> bashGen.log
./bashGen.sh
if [[ "${?}" == "1" ]]
then
  echo "FAILED test10" >> bashGen.log
  echo "./bashGen.sh" >> bashGen.log
else
  echo "TRUE" >> bashGen.log
fi

echo

for (( i = 1; i<11; i++ ));
do
  rm "test${i}.sh"
  if [[ "${?}" == "1" ]]
  then
    echo "couldn't delete test${i}.sh" >> bashGen.log
  fi
done
exit 0
