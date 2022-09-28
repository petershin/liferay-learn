import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.ProductResource;

public class Product_GET_ById {

	public static void main(String[] args) throws Exception {
		ProductResource.Builder builder = ProductResource.builder();

		ProductResource productResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			productResource.getProduct(Long.valueOf(System.getProperty("id"))));
	}

}