import com.liferay.headless.commerce.delivery.catalog.client.dto.v1_0.Product;
import com.liferay.headless.commerce.delivery.catalog.client.pagination.Page;
import com.liferay.headless.commerce.delivery.catalog.client.pagination.Pagination;
import com.liferay.headless.commerce.delivery.catalog.client.resource.v1_0.ProductResource;

public class Products_GET_FromChannels {

	/**
	 * java -classpath .:* -DchannelId=1234 Products_GET_FromChannels
	 */
	public static void main(String[] args) throws Exception {
		ProductResource.Builder builder = ProductResource.builder();

		ProductResource productResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Page<Product> page = productResource.getChannelProductsPage(
			Long.valueOf(System.getProperty("channelId")), null, null, null,
			Pagination.of(1, 2), null);

		System.out.println(page);
	}

}