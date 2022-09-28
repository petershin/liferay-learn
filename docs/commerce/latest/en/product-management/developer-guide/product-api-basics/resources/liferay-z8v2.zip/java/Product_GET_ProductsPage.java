import com.liferay.headless.commerce.admin.catalog.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.ProductResource;

public class Product_GET_ProductsPage {

	public static void main(String[] args) throws Exception {
		ProductResource.Builder builder = ProductResource.builder();

		ProductResource productResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		if (args.length > 0) {
			System.out.println(
				productResource.getProductsPage(
					args[0], args[1],
					Pagination.of(
						Integer.valueOf(args[2]), Integer.valueOf(args[3])),
					args[4]));
		}
		else {
			System.out.println(
				productResource.getProductsPage("", "", null, ""));
		}
	}

}