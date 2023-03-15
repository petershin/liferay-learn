import com.liferay.headless.commerce.admin.order.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.order.client.resource.v1_0.OrderTypeResource;

public class OrderTypes_GET_FromInstance {

	/**
	 * java -classpath .:* OrderTypes_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		OrderTypeResource.Builder builder = OrderTypeResource.builder();

		OrderTypeResource orderTypeResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			orderTypeResource.getOrderTypesPage(
				null, null, Pagination.of(1, 2), null));
	}

}