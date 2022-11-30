import com.liferay.headless.commerce.admin.pricing.client.resource.v2_0.PriceListResource;

public class PriceList_GET_ById {

	/**
	 * java -classpath .:* -DpriceListId=1234 PriceList_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		PriceListResource.Builder builder = PriceListResource.builder();

		PriceListResource priceListResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			priceListResource.getPriceList(
				Long.valueOf(System.getProperty("priceListId"))));
	}

}