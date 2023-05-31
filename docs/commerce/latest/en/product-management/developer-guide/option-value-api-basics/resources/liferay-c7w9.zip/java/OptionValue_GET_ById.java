import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.OptionValueResource;

public class OptionValue_GET_ById {

	/**
	 * java -classpath .:* -DoptionValueId=1234 OptionValue_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		OptionValueResource.Builder builder = OptionValueResource.builder();

		OptionValueResource optionValueResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			optionValueResource.getOptionValue(
				Long.valueOf(System.getProperty("optionValueId"))));
	}

}