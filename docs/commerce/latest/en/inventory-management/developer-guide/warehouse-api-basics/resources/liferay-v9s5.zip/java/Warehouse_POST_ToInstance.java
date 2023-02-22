import com.liferay.headless.commerce.admin.inventory.client.dto.v1_0.Warehouse;
import com.liferay.headless.commerce.admin.inventory.client.resource.v1_0.WarehouseResource;

import java.util.HashMap;

public class Warehouse_POST_ToInstance {

	/**
	 * java -classpath .:* -DwarehouseId=1234 Warehouse_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		WarehouseResource.Builder builder = WarehouseResource.builder();

		WarehouseResource warehouseResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			warehouseResource.postWarehouse(
				new Warehouse() {
					{
						active = false;
						name = new HashMap<String, String>() {
							{
								put("en_US", "Foo");
							}
						};
					}
				}));
	}

}