import com.liferay.headless.commerce.admin.inventory.client.resource.v1_0.WarehouseResource;

public class Warehouse_DELETE_ById {

	/**
	 * java -classpath .:* -DwarehouseId=1234 Warehouse_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		WarehouseResource.Builder builder = WarehouseResource.builder();

		WarehouseResource warehouseResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		warehouseResource.deleteWarehouseId(
			Long.valueOf(System.getProperty("warehouseId")));
	}

}