#!/bin/bash

set -e

if [ "$TEST_TYPE" = "integ" ]
then
  sbt "testOnly *Integ"
elif [ "$TEST_TYPE" = "assembly" ]
then
  cd /source
  sbt assembly
elif [ "$TEST_TYPE" = "all" ]
then
  sbt "testOnly *Spec"
else
  mongod &
  sbt "testOnly *Spec"
  mongod --shutdown
  sbt assembly
fi
