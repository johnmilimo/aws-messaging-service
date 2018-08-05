import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.auth.DefaultAWSCredentialsProviderChain;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClientBuilder;

public class NQClient {

    static AmazonSNSClient initSnsClient(){
        AmazonSNSClient snsClient = new AmazonSNSClient(new DefaultAWSCredentialsProviderChain());
        snsClient.setRegion(Region.getRegion(Regions.EU_WEST_1));
        return snsClient;
    }

    static AmazonSQS initSqsClient(){
        return AmazonSQSClientBuilder.defaultClient();
    }

}
