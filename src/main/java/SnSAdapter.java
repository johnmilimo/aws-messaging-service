import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.auth.DefaultAWSCredentialsProviderChain;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.sns.model.CreateTopicRequest;
import com.amazonaws.services.sns.model.CreateTopicResult;
import com.amazonaws.services.sns.model.SubscribeRequest;
import com.amazonaws.services.sns.model.PublishRequest;
import com.amazonaws.services.sns.model.PublishResult;
import com.amazonaws.services.sns.model.DeleteTopicRequest;

public class SnSAdapter extends NQClient {

    static String createSnSTopic(String topicName){

        //create a new SNS client and set endpoint
        AmazonSNSClient snsClient = initSnsClient();
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

    static void publishMessage(String topicArn, String msg){

        //create a new SNS client and set endpoint
        AmazonSNSClient snsClient = initSnsClient();

        //publish to an SNS topic
        PublishRequest publishRequest = new PublishRequest(topicArn, msg);
        PublishResult publishResult = snsClient.publish(publishRequest);

        //print MessageId of message published to SNS topic
        System.out.println("MessageId - " + publishResult.getMessageId());
    }

}
