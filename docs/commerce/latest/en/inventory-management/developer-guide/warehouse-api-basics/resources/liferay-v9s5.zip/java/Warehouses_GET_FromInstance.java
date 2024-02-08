import com.liferay.headless.commerce.admin.inventory.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.inventory.client.resource.v1_0.WarehouseResource;

public class Warehouses_GET_FromInstance {

	/**
	 * java -classpath .:* Warehouses_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		WarehouseResource.Builder builder = WarehouseResource.builder();

		WarehouseResource warehouseResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			warehouseResource.getWarehousesPage(
				null, Pagination.of(1, 2), null));
	}

}