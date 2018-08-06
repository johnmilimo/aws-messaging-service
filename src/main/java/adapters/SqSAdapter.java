package adapters;

import adapters.NQClient;
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.model.AmazonSQSException;
import com.amazonaws.services.sqs.model.CreateQueueResult;
import com.amazonaws.services.sqs.model.Message;
import com.amazonaws.services.sns.util.Topics;

import java.util.List;

public class SqSAdapter extends NQClient {

    public String createQueue(String queueName){
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

    public void subscribeQueue(String topicArn, String queueUrl){
        // Subscribe Topic with Queue
        Topics.subscribeQueue(initSnsClient(), initSqsClient(), topicArn, queueUrl);
    }

    public String getQueueUrl(String queueName){
        return initSqsClient().getQueueUrl(queueName).getQueueUrl();
    }

    public List<Message> getMessages(String queueUrl){
        return initSqsClient().receiveMessage(queueUrl).getMessages();
    }
}
