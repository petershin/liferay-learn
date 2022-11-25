import com.liferay.headless.commerce.admin.order.client.dto.v1_0.Order;
import com.liferay.headless.commerce.admin.order.client.resource.v1_0.OrderResource;

public class Order_POST_ToChannel {

	/**
	 * java -classpath .:* -DaccountId=5678 -DchannelId=1234 -DcurrencyCode=Foo Order_POST_ToChannel
	 */
	public static void main(String[] args) throws Exception {
		OrderResource.Builder builder = OrderResource.builder();

		OrderResource orderResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			orderResource.postOrder(
				new Order() {
					{
						accountId = Long.valueOf(
							System.getProperty("accountId"));
						channelId = Long.valueOf(
							System.getProperty("channelId"));
						currencyCode = String.valueOf(
							System.getProperty("currencyCode"));
					}
				}));
	}

}