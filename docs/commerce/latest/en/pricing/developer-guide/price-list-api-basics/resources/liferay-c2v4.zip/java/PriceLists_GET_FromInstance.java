import com.liferay.headless.commerce.admin.pricing.client.dto.v2_0.PriceList;
import com.liferay.headless.commerce.admin.pricing.client.pagination.Page;
import com.liferay.headless.commerce.admin.pricing.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.pricing.client.resource.v2_0.PriceListResource;

public class PriceLists_GET_FromInstance {

	/**
	 * java -classpath .:* PriceLists_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		PriceListResource.Builder builder = PriceListResource.builder();

		PriceListResource priceListResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Page<PriceList> page = priceListResource.getPriceListsPage(
			null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}