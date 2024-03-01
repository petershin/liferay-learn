import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Currency;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.CurrencyResource;

import java.math.BigDecimal;

import java.util.HashMap;

public class Currency_POST_ToInstance {

	/**
	 * java -classpath .:* Currency_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		CurrencyResource.Builder builder = CurrencyResource.builder();

		CurrencyResource currencyResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			currencyResource.postCurrency(
				new Currency() {
					{
						code = "AED";
						name = new HashMap<String, String>() {
							{
								put("en_US", "UAE Dirham");
							}
						};
						rate = new BigDecimal(3.67);
					}
				}));
	}

}