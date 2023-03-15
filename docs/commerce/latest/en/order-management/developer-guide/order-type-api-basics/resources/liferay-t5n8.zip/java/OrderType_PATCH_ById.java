import com.liferay.headless.commerce.admin.order.client.dto.v1_0.OrderType;
import com.liferay.headless.commerce.admin.order.client.resource.v1_0.OrderTypeResource;

import java.util.HashMap;

public class OrderType_PATCH_ById {

	/**
	 * java -classpath .:* -DorderTypeId=1234 OrderType_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		OrderTypeResource.Builder builder = OrderTypeResource.builder();

		OrderTypeResource orderTypeResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		orderTypeResource.patchOrderType(
			Long.valueOf(System.getProperty("orderTypeId")),
			new OrderType() {
				{
					name = new HashMap<String, String>() {
						{
							put("en_US", "Bar");
						}
					};
				}
			});
	}

}