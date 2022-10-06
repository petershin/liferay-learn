import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.ProductResource;

public class Product_DELETE_ById {

	/**
	 * java -classpath .:* -DproductId=1234 Product_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		ProductResource.Builder builder = ProductResource.builder();

		ProductResource productResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		productResource.deleteProduct(
			Long.valueOf(System.getProperty("productId")));
	}

}