import com.liferay.headless.admin.address.client.resource.v1_0.CountryResource;

public class Country_DELETE_ById {

	/**
	 * java -classpath .:* -DcountryId=1234 Country_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		CountryResource.Builder builder = CountryResource.builder();

		CountryResource countryResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		countryResource.deleteCountry(
			Long.valueOf(System.getProperty("countryId")));
	}

}