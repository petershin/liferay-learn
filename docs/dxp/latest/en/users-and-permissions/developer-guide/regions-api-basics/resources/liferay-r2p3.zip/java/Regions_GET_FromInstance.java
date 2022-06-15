import com.liferay.headless.admin.address.client.dto.v1_0.Region;
import com.liferay.headless.admin.address.client.pagination.Page;
import com.liferay.headless.admin.address.client.pagination.Pagination;
import com.liferay.headless.admin.address.client.resource.v1_0.RegionResource;

public class Regions_GET_FromInstance {

	/**
	 * java -classpath .:* Regions_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		RegionResource.Builder builder = RegionResource.builder();

		RegionResource regionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Page<Region> page = regionResource.getRegionsPage(
			null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}