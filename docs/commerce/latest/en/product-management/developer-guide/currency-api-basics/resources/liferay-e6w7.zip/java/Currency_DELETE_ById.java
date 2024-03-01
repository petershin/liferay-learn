import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.CurrencyResource;

public class Currency_DELETE_ById {

	/**
	 * java -classpath .:* -DcurrencyId=1234 Currency_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		CurrencyResource.Builder builder = CurrencyResource.builder();

		CurrencyResource currencyResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		currencyResource.deleteCurrency(
			Long.valueOf(System.getProperty("currencyId")));
	}

}