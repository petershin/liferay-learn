import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Product;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.ProductResource;

import java.util.HashMap;

public class Product_POST_ToCatalog {

	/**
	 * java -classpath .:* -DcatalogId=1234 Product_POST_ToCatalog
	 */
	public static void main(String[] args) throws Exception {
		ProductResource.Builder builder = ProductResource.builder();

		ProductResource productResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			productResource.postProduct(
				new Product() {
					{
						active = true;
						catalogId = Long.valueOf(
							System.getProperty("catalogId"));
						name = new HashMap<String, String>() {
							{
								put("en_US", "Foo");
							}
						};
						productType = "simple";
					}
				}));
	}

}