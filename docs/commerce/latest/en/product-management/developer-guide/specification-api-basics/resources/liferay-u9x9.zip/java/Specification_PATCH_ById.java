import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Specification;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.SpecificationResource;

import java.util.HashMap;

public class Specification_PATCH_ById {

	/**
	 * java -classpath .:* -DspecificationId=1234 Specification_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		SpecificationResource.Builder builder = SpecificationResource.builder();

		SpecificationResource specificationResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		specificationResource.patchSpecification(
			Long.valueOf(System.getProperty("specificationId")),
			new Specification() {
				{
					key = "bar";
					title = new HashMap<String, String>() {
						{
							put("en_US", "Bar");
						}
					};
				}
			});
	}

}