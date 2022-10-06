import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Product;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.ProductResource;

import java.util.HashMap;

public class Product_PATCH_ById {

	/**
	 * java -classpath .:* -DproductId=1234 Product_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		ProductResource.Builder builder = ProductResource.builder();

		ProductResource productResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		productResource.patchProduct(
			Long.valueOf(System.getProperty("productId")),
			new Product() {
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