import com.liferay.headless.commerce.admin.order.client.resource.v1_0.OrderTypeResource;

public class OrderType_DELETE_ById {

	/**
	 * java -classpath .:* -DorderTypeId=1234 OrderType_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		OrderTypeResource.Builder builder = OrderTypeResource.builder();

		OrderTypeResource orderTypeResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		orderTypeResource.deleteOrderType(
			Long.valueOf(System.getProperty("orderTypeId")));
	}

}