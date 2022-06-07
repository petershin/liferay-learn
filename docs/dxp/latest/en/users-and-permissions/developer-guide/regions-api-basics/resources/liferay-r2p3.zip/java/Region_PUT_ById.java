import com.liferay.headless.admin.address.client.dto.v1_0.Region;
import com.liferay.headless.admin.address.client.resource.v1_0.RegionResource;

public class Region_PUT_ById {

	/**
	 * java -classpath .:* -DregionId=1234 Region_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		RegionResource.Builder builder = RegionResource.builder();

		RegionResource regionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Region region = regionResource.putRegion(
			Long.valueOf(System.getProperty("regionId")),
			new Region() {
				{
					name = "Goo";
					regionCode = "ABL";
				}
			});

		System.out.println(region);
	}

}