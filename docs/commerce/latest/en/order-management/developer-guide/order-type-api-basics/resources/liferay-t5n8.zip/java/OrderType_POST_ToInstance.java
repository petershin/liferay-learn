import com.liferay.headless.commerce.admin.order.client.dto.v1_0.OrderType;
import com.liferay.headless.commerce.admin.order.client.resource.v1_0.OrderTypeResource;

import java.util.HashMap;

public class OrderType_POST_ToInstance {

	/**
	 * java -classpath .:* OrderType_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		OrderTypeResource.Builder builder = OrderTypeResource.builder();

		OrderTypeResource orderTypeResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			orderTypeResource.postOrderType(
				new OrderType() {
					{
						name = new HashMap<String, String>() {
							{
								put("en_US", "Foo");
							}
						};
					}
				}));
	}

}