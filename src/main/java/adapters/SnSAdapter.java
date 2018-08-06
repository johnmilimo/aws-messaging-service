package adapters;

import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.model.CreateTopicRequest;
import com.amazonaws.services.sns.model.CreateTopicResult;
import com.amazonaws.services.sns.model.PublishRequest;
import com.amazonaws.services.sns.model.PublishResult;

public class SnSAdapter extends NQClient {

    public String createSnSTopic(String topicName){

        //create a new SNS client and set endpoint
        AmazonSNSClient snsClient = NQClient.initSnsClient();
        //create a new SNS topic
        CreateTopicRequest createTopicRequest = new CreateTopicRequest(topicName);
        CreateTopicResult createTopicResult = snsClient.createTopic(createTopicRequest);

        //TopicArn
        String topicArn = createTopicResult.getTopicArn();
        System.out.println(topicArn);
        //get request id for CreateTopicRequest from SNS metadata
        System.out.println("CreateTopicRequest - " + snsClient.getCachedResponseMetadata(createTopicRequest));

        return topicArn;
    }

    public void publishMessage(String topicArn, String msg){

        //create a new SNS client and set endpoint
        AmazonSNSClient snsClient = NQClient.initSnsClient();

        //publish to an SNS topic
        PublishRequest publishRequest = new PublishRequest(topicArn, msg);
        PublishResult publishResult = snsClient.publish(publishRequest);

        //print MessageId of message published to SNS topic
        System.out.println("MessageId - " + publishResult.getMessageId());
    }

}
