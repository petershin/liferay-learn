import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.OptionValueResource;

public class OptionValue_DELETE_ById {

	/**
	 * java -classpath .:* -DoptionValueId=1234 OptionValue_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		OptionValueResource.Builder builder = OptionValueResource.builder();

		OptionValueResource optionValueResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		optionValueResource.deleteOptionValue(
			Long.valueOf(System.getProperty("optionValueId")));
	}

}