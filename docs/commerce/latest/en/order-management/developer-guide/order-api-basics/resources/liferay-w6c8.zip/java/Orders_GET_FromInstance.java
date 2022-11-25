import com.liferay.headless.commerce.admin.order.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.order.client.resource.v1_0.OrderResource;

public class Orders_GET_FromInstance {

	/**
	 * java -classpath .:* Orders_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		OrderResource.Builder builder = OrderResource.builder();

		OrderResource orderResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			orderResource.getOrdersPage(null, null, Pagination.of(1, 2), null));
	}

}