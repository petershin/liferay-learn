import com.liferay.headless.admin.address.client.dto.v1_0.Region;
import com.liferay.headless.admin.address.client.resource.v1_0.RegionResource;

public class Region_POST_ToCountry {

	/**
	 * java -classpath .:* -DcountryId=1234 Region_POST_ToCountry
	 */
	public static void main(String[] args) throws Exception {
		RegionResource.Builder builder = RegionResource.builder();

		RegionResource regionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Region region = regionResource.postCountryRegion(
			Long.valueOf(System.getProperty("countryId")),
			new Region() {
				{
					name = "Foo";
					regionCode = "ABL";
				}
			});

		System.out.println(region);
	}

}