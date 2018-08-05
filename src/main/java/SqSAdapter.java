import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClientBuilder;
import com.amazonaws.services.sqs.model.AmazonSQSException;
import com.amazonaws.services.sqs.model.CreateQueueRequest;
import com.amazonaws.services.sqs.model.CreateQueueResult;
import com.amazonaws.services.sns.util.Topics;

public class SqSAdapter extends NQClient {

    static String createQueue(String queueName){
        AmazonSQS sqs = initSqsClient();
        String queueUrl;
        try {
            CreateQueueResult createQueueResult = sqs.createQueue(queueName);
            queueUrl = createQueueResult.getQueueUrl();
            System.out.println("Queue url "+ queueUrl);
            return queueUrl;
        } catch (AmazonSQSException e) {
            if (!e.getErrorCode().equals("QueueAlreadyExists")) throw e;
        }
        return null;
    }

    static void subscribeQueue(String topicArn, String queueUrl){
        // Subscribe Topic with Queue
        Topics.subscribeQueue(initSnsClient(), initSqsClient(), topicArn, queueUrl);
    }
}
