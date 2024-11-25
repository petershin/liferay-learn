import com.liferay.headless.admin.address.client.dto.v1_0.Country;
import com.liferay.headless.admin.address.client.resource.v1_0.CountryResource;

public class Country_PATCH_ById {

	/**
	 * java -classpath .:* -DcountryId=1234 Country_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		CountryResource.Builder builder = CountryResource.builder();

		CountryResource countryResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Country country = countryResource.patchCountry(
			Long.valueOf(System.getProperty("countryId")),
			new Country() {
				{
					name = "Bar";
				}
			});

		System.out.println(country);
	}

}