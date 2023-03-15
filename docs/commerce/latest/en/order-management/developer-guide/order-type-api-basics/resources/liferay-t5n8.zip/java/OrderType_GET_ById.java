import com.liferay.headless.commerce.admin.order.client.resource.v1_0.OrderTypeResource;

public class OrderType_GET_ById {

	/**
	 * java -classpath .:* -DorderTypeId=1234 OrderType_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		OrderTypeResource.Builder builder = OrderTypeResource.builder();

		OrderTypeResource orderTypeResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			orderTypeResource.getOrderType(
				Long.valueOf(System.getProperty("orderTypeId"))));
	}

}