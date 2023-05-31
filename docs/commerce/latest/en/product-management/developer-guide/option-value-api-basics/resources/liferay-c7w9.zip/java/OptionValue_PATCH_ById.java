import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.OptionValue;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.OptionValueResource;

public class OptionValue_PATCH_ById {

	/**
	 * java -classpath .:* -DoptionValueId=1234 OptionValue_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		OptionValueResource.Builder builder = OptionValueResource.builder();

		OptionValueResource optionValueResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		optionValueResource.patchOptionValue(
			Long.valueOf(System.getProperty("optionValueId")),
			new OptionValue() {
				{
					name = new HashMap<String, String>() {
						{
							put("en_US", "Baker");
						}
					};
				}
			});
	}

}