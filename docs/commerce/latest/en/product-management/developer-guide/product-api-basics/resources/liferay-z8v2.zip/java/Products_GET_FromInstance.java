import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Product;
import com.liferay.headless.commerce.admin.catalog.client.pagination.Page;
import com.liferay.headless.commerce.admin.catalog.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.ProductResource;

public class Products_GET_FromInstance {

	/**
	 * java -classpath .:* Products_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		ProductResource.Builder builder = ProductResource.builder();

		ProductResource productResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Page<Product> page = productResource.getProductsPage(
			null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}