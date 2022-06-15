import com.liferay.headless.admin.address.client.dto.v1_0.Country;
import com.liferay.headless.admin.address.client.pagination.Page;
import com.liferay.headless.admin.address.client.pagination.Pagination;
import com.liferay.headless.admin.address.client.resource.v1_0.CountryResource;

public class Countries_GET_FromInstance {

	/**
	 * java -classpath .:* Countries_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		CountryResource.Builder builder = CountryResource.builder();

		CountryResource countryResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Page<Country> page = countryResource.getCountriesPage(
			null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}