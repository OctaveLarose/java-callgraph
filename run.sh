#!/bin/sh

java -Xbootclasspath/a:./target/javacg-0.1-SNAPSHOT-dycg-agent.jar:benchmarks.jar -javaagent:./target/javacg-0.1-SNAPSHOT-dycg-agent.jar="incl=.*;excl=[java|sun|gr].*" -classpath benchmarks.jar Harness DeltaBlue 3
