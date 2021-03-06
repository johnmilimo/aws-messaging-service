/*
 * This Java source file was generated by the Gradle 'init' task.
 */

import adapters.SnSAdapter;
import adapters.SqSAdapter;

public class App {

    public static void main(String[] args) {

        // Create SnS Topic
        String topicName = System.getenv("TOPIC_NAME");
        System.out.println("Topic Name: "+topicName);

        String topicArn = new SnSAdapter().createSnSTopic(topicName);

        // Create SqS Queue
        String queueName = System.getenv("QUEUE_NAME");
        System.out.println("Queue Name: "+queueName);

        String queueUrl = new SqSAdapter().createQueue(queueName);

        // Subscribe the Queue to the Topic
        new SqSAdapter().subscribeQueue(topicArn, queueUrl);

        // Publish a sample message to the Topic, and it will be send to the Queue
        String message = System.getenv("SAMPLE_MESSAGE");
        System.out.println("Message: "+message);

        new SnSAdapter().publishMessage(topicArn, message);
    }
}
