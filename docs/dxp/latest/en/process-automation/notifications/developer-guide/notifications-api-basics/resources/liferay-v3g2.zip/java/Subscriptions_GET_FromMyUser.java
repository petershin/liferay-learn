import com.liferay.headless.admin.user.client.resource.v1_0.SubscriptionResource;
import com.liferay.headless.admin.user.client.dto.v1_0.Subscription;
import com.liferay.headless.admin.user.client.pagination.Page;
import com.liferay.headless.admin.user.client.pagination.Pagination;

public class Subscriptions_GET_FromMyUser {

	/**
	 * java -classpath .:* Subscriptions_GET_FromMyUser
	 */
	public static void main(String[] args) throws Exception {
		SubscriptionResource.Builder builder =
			SubscriptionResource.builder();

		SubscriptionResource subscriptionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			subscriptionResource.getMyUserAccountSubscriptionsPage(
				null, Pagination.of(1,10)));
	}

}