import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Option;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.OptionResource;

import java.util.HashMap;

public class Option_PATCH_ById {

	/**
	 * java -classpath .:* -DoptionId=1234 Option_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		OptionResource.Builder builder = OptionResource.builder();

		OptionResource optionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		optionResource.patchOption(
			Long.valueOf(System.getProperty("optionId")),
			new Option() {
				{
					fieldType = Option.FieldType.RADIO;
					key = "bar";
					name = new HashMap<String, String>() {
						{
							put("en_US", "Bar");
						}
					};
				}
			});
	}

}