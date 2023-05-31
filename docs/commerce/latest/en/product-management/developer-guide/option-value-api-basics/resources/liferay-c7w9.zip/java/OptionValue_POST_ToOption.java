import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.OptionValue;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.OptionValueResource;

import java.util.HashMap;

public class OptionValue_POST_ToOption {

	/**
	 * java -classpath .:* -DoptionId=1234 OptionValue_POST_ToOption
	 */
	public static void main(String[] args) throws Exception {
		OptionValueResource.Builder builder = OptionValueResource.builder();

		OptionValueResource optionValueResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			optionValueResource.postOptionIdOptionValue(
				Long.valueOf(System.getProperty("optionId")),
				new OptionValue() {
					{
						key = "able";
						name = new HashMap<String, String>() {
							{
								put("en_US", "Able");
							}
						};
					}
				}));
	}

}