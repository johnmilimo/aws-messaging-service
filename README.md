# AWS SnS and SqS in action

## Set Your AWS credentials on your environment
```
$ export AWS_SECRET_KEY=your_aws_secret_key
```
```
$ export AWS_ACCESS_KEY_ID=your_aws_access_key_id
```
```
$ export AWS_REGION=aws_region
```

## Build the code
```
$ ./gradlew build && java -jar build/libs/java-demo.jar
```

## Run
```
$ ./gradlew run
```

## What happens when the service runs

        1) A SnS Topic is created named `MySampleTopic`

        2) A SqS Queue is created named `MySampleQueue`

        3) The queue is subscribed to the Topic

        4) A message is published to the Topic, and it should appear on the Queue


## For more details

```
https://github.com/johnmilimo/java-demo/blob/master/src/main/java/App.java
```
