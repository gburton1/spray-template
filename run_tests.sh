#!/bin/bash

set -e

if [ "$TEST_TYPE" = "integ" ]
then
  sbt "testOnly *Integ"
elif [ "$TEST_TYPE" = "watch-front" ]
then
  mongod &
  sbt run &
  cd /source/client
  Xvfb :1 -screen 0 1024x768x16 &>/dev/null  &
  echo ">>> NPM is broken (again) so front-end tests are temporarily disabled."
  # gulp watch
  cat
elif [ "$TEST_TYPE" = "all" ]
then
  sbt "testOnly *Spec"
  echo ">>> Running tests before generating JAR."
  cd /source
  sbt assembly
else
  mongod &
  sbt "testOnly *Spec"
  mongod --shutdown
  sbt assembly
fi
