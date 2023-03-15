import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Specification;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.SpecificationResource;

import java.util.HashMap;

public class Specification_POST_ToInstance {

	/**
	 * java -classpath .:* -DcatalogId=1234 Specification_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		SpecificationResource.Builder builder = SpecificationResource.builder();

		SpecificationResource specificationResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			specificationResource.postSpecification(
				new Specification() {
					{
						key = "foo";
						title = new HashMap<String, String>() {
							{
								put("en_US", "Foo");
							}
						};
					}
				}));
	}

}