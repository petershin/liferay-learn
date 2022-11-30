import com.liferay.headless.commerce.admin.pricing.client.dto.v2_0.PriceList;
import com.liferay.headless.commerce.admin.pricing.client.resource.v2_0.PriceListResource;

public class PriceList_PATCH_ById {

	/**
	 * java -classpath .:* -DpriceListId=1234 PriceList_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		PriceListResource.Builder builder = PriceListResource.builder();

		PriceListResource priceListResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		priceListResource.patchPriceList(
			Long.valueOf(System.getProperty("priceListId")),
			new PriceList() {
				{
					name = "Baker";
				}
			});
	}

}