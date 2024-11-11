import com.liferay.headless.commerce.delivery.catalog.client.resource.v1_0.ProductResource;

public class Products_GET_ById {

	/**
	 * java -classpath .:* -DchannelId=1234 -DproductId=5678 Products_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		ProductResource.Builder builder = ProductResource.builder();

		ProductResource productResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			productResource.getChannelProduct(
				Long.valueOf(System.getProperty("channelId")),
				Long.valueOf(System.getProperty("productId")), null));
	}

}