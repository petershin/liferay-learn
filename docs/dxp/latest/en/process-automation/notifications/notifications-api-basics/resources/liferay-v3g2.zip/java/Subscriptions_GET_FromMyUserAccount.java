import com.liferay.headless.admin.user.client.pagination.Pagination;
import com.liferay.headless.admin.user.client.resource.v1_0.SubscriptionResource;

public class Subscriptions_GET_FromMyUserAccount {

	/**
	 * java -classpath .:* Subscriptions_GET_FromMyUserAccount
	 */
	public static void main(String[] args) throws Exception {
		SubscriptionResource.Builder builder = SubscriptionResource.builder();

		SubscriptionResource subscriptionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			subscriptionResource.getMyUserAccountSubscriptionsPage(
				null, Pagination.of(1, 10)));
	}

}