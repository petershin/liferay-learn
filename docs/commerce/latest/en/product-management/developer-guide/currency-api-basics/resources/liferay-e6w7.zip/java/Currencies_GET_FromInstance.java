import com.liferay.headless.commerce.admin.catalog.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.CurrencyResource;

public class Currencies_GET_FromInstance {

	/**
	 * java -classpath .:* Currencies_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		CurrencyResource.Builder builder = CurrencyResource.builder();

		CurrencyResource currencyResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			currencyResource.getCurrenciesPage(
				null, null, Pagination.of(1, 2), null));
	}

}