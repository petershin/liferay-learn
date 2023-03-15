import com.liferay.headless.commerce.admin.catalog.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.SpecificationResource;

public class Specifications_GET_FromInstance {

	/**
	 * java -classpath .:* Specifications_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		SpecificationResource.Builder builder = SpecificationResource.builder();

		SpecificationResource specificationResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			specificationResource.getSpecificationsPage(
				null, null, Pagination.of(1, 2), null));
	}

}