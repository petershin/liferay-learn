import com.liferay.headless.commerce.admin.order.client.resource.v1_0.OrderResource;

public class Order_DELETE_ById {

	/**
	 * java -classpath .:* -DorderId=1234 Order_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		OrderResource.Builder builder = OrderResource.builder();

		OrderResource orderResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		orderResource.deleteOrder(Long.valueOf(System.getProperty("orderId")));
	}

}