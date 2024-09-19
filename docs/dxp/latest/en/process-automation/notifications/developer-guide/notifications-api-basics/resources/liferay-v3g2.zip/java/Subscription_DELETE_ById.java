import com.liferay.headless.admin.user.client.resource.v1_0.SubscriptionResource;

public class Subscription_DELETE_ById {

	/**
	 * java -classpath .:* -DsubscriptionId=1234 Subscription_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		SubscriptionResource.Builder builder = SubscriptionResource.builder();

		SubscriptionResource subscriptionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		subscriptionResource.deleteMyUserAccountSubscription(
			Long.valueOf(System.getProperty("subscriptionId")));
	}

}