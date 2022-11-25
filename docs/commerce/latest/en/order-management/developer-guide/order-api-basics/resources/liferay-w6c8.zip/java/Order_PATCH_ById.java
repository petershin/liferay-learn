import com.liferay.headless.commerce.admin.order.client.dto.v1_0.Order;
import com.liferay.headless.commerce.admin.order.client.resource.v1_0.OrderResource;

public class Order_PATCH_ById {

	/**
	 * java -classpath .:* -DorderId=1234 Order_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		OrderResource.Builder builder = OrderResource.builder();

		OrderResource orderResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		orderResource.patchOrder(
			Long.valueOf(System.getProperty("orderId")),
			new Order() {
				{
					externalReferenceCode = "Able";
				}
			});
	}

}