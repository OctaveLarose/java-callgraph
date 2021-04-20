#!/bin/bash

BENCHMARKS_DIR="$HOME/are-we-fast-yet/benchmarks/Java/src"

BENCHMARK_NAMES=(`pushd $BENCHMARKS_DIR > /dev/null ; ls *.java | sed 's/\.java$\|^Harness|^Run|^Benchmark//g' ; popd > /dev/null`)

NBR_ITER=1

for NAME in "${BENCHMARK_NAMES[@]}"
do
  echo $NAME
  java -Xbootclasspath/a:./target/javacg-0.1-SNAPSHOT-dycg-agent.jar:benchmarks.jar -javaagent:./target/javacg-0.1-SNAPSHOT-dycg-agent.jar="incl=.*;excl=[java|sun|gr|Harness].*" -classpath benchmarks.jar Harness $NAME $NBR_ITER
  mv calltrace.txt calltrace_$NAME.txt
done
