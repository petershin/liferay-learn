import com.liferay.headless.commerce.admin.pricing.client.dto.v2_0.PriceList;
import com.liferay.headless.commerce.admin.pricing.client.resource.v2_0.PriceListResource;

public class PriceList_POST_ToCatalog {

	/**
	 * java -classpath .:* -DcatalogId=1234 PriceList_POST_ToCatalog
	 */
	public static void main(String[] args) throws Exception {
		PriceListResource.Builder builder = PriceListResource.builder();

		PriceListResource priceListResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			priceListResource.postPriceList(
				new PriceList() {
					{
						catalogId = Long.valueOf(
							System.getProperty("catalogId"));
						currencyCode = "USD";
						name = "Able";
						type = PriceList.Type.PRICE_LIST;
					}
				}));
	}

}