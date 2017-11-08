#!/bin/bash

# Runs the JSON parser over a suite of selected JSON test files

PASS=Tests/Pass/*
FAIL=Tests/Fail/*
FILE=0
PASSEDTESTS=0

ant jar # Build Compiler
{
echo "JSON Pass Tests: " $'\n'

for testfile in $PASS
do
  ((FILE++))
  java -jar jar/Compiler.jar $testfile &> /dev/null # Discard output
  if [ $? -eq 0 ] # Success exit code
    then
      ((PASSEDTESTS++))
      echo "$testfile [✓]" $'\n'
    else
      echo "$testfile failed : Error [x]" $'\n'
  fi
  cat $testfile
  echo $'\n'
done

echo "-------------------------------"
echo $"JSON Fail Tests: " $'\n'

for testfile in $FAIL
do
  ((FILE++))
  java -jar jar/Compiler.jar $testfile &> /dev/null # Discard output
  if [ $? -eq 1 ] # Error exit code
    then
      echo "$testfile [✓]" $'\n'
      ((PASSEDTESTS++))
    else
      echo "$testfile passed : Error [x]"$'\n'
  fi
  cat $testfile
  echo $'\n'
done

echo "-------------------------------"
echo $PASSEDTESTS of $FILE tests passed

} >testfile.txt
