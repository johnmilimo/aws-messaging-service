#!/usr/bin/env bash

export QUEUE_NAME="MySampleQueue"
export TOPIC_NAME="MySampleTopic"
export SAMPLE_MESSAGE="Trying to think of a message....oh yeah got it!"

./gradlew build && java -jar build/libs/java-demo.jar

./gradlew run

./gradlew appRun
