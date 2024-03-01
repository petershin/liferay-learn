import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Currency;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.CurrencyResource;

import java.util.HashMap;

public class Currency_PATCH_ById {

	/**
	 * java -classpath .:* -DcurrencyId=1234 Currency_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		CurrencyResource.Builder builder = CurrencyResource.builder();

		CurrencyResource currencyResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		currencyResource.patchCurrency(
			Long.valueOf(System.getProperty("currencyId")),
			new Currency() {
				{
					name = new HashMap<String, String>() {
						{
							put("en_US", "United Arab Emirates Dirham");
						}
					};
				}
			});
	}

}