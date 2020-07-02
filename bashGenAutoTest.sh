#!/bin/bash

# remove any old logs
rm bashGenTest.log

echo
echo "test1: F" >> bashGenTest.log
./bashGen.sh test1
if [[ "${?}" == "1" ]]
then
  echo "FAILED test1" >> bashGenTest.log
  echo "./bashGen.sh test1" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

echo
echo "test2: F" >> bashGenTest.log
./bashGen.sh test2 -
if [[ "${?}" == "1" ]]
then
  echo "FAILED test2" >> bashGenTest.log
  echo "./bashGen.sh test2 -" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

echo
echo "test3: T" >> bashGenTest.log
./bashGen.sh test3 -a
if [[ "${?}" == "1" ]]
then
  echo "FAILED test3" >> bashGenTest.log
  echo "./bashGen.sh test3 -a" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

echo
echo "test4: T" >> bashGenTest.log
./bashGen.sh test4 -v
if [[ "${?}" == "1" ]]
then
  echo "FAILED test4" >> bashGenTest.log
  echo "./bashGen.sh test4 -v" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

echo
echo "test5: F" >> bashGenTest.log
./bashGen.sh test5 - -
if [[ "${?}" == "1" ]]
then
  echo "FAILED test5" >> bashGenTest.log
  echo "./bashGen.sh test5 - -" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

echo
echo "test6: T/F" >> bashGenTest.log
touch test6.sh
echo "test6">>test6.sh
./bashGen.sh test6 -v
if [[ "${?}" == "1" ]]
then
  echo "FAILED test6" >> bashGenTest.log
  echo "touch test6.sh \
    echo \"test6\">>test6.sh\
        ./bashGen.sh test6 -v" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

echo
echo "test7: T/F" >> bashGenTest.log
touch test7.sh
echo "test7">>test7.sh
./bashGen.sh test7 -a
if [[ "${?}" == "1" ]]
then
  echo "FAILED test7" >> bashGenTest.log
  echo "touch test7.sh \
    echo \"test6\">>test6.sh\
        ./bashGen.sh test7 -a" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

echo
echo "test8: T" >> bashGenTest.log
./bashGen.sh -h
if [[ "${?}" == "1" ]]
then
  echo "FAILED test8" >> bashGenTest.log
  echo "./bashGen.sh -h" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

echo
echo "test9: T" >> bashGenTest.log
./bashGen.sh --help
if [[ "${?}" == "1" ]]
then
  echo "FAILED test9" >> bashGenTest.log
  echo "./bashGen.sh --help" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

echo
echo "test10: F" >> bashGenTest.log
./bashGen.sh
if [[ "${?}" == "1" ]]
then
  echo "FAILED test10" >> bashGenTest.log
  echo "./bashGen.sh" >> bashGenTest.log
else
  echo "TRUE" >> bashGenTest.log
fi

echo

for (( i = 1; i<11; i++ ));
do
  rm "test${i}.sh"
  if [[ "${?}" == "1" ]]
  then
    echo "couldn't delete test${i}.sh" >> bashGenTest.log
  fi
done
exit 0
