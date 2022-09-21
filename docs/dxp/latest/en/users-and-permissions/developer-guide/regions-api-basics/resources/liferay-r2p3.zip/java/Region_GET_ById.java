import com.liferay.headless.admin.address.client.resource.v1_0.RegionResource;

public class Region_GET_ById {

	/**
	 * java -classpath .:* -DregionId=1234 Region_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		RegionResource.Builder builder = RegionResource.builder();

		RegionResource regionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			regionResource.getRegion(
				Long.valueOf(System.getProperty("regionId"))));
	}

}