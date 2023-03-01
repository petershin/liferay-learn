import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Option;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.OptionResource;

import java.util.HashMap;

public class Option_POST_ToInstance {

	/**
	 * java -classpath .:* -DcatalogId=1234 Option_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		OptionResource.Builder builder = OptionResource.builder();

		OptionResource optionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			optionResource.postOption(
				new Option() {
					{
						fieldType = Option.FieldType.SELECT;
						key = "foo";
						name = new HashMap<String, String>() {
							{
								put("en_US", "Foo");
							}
						};
					}
				}));
	}

}