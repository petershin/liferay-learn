import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.OptionResource;

public class Option_GET_ById {

	/**
	 * java -classpath .:* -DoptionId=1234 Option_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		OptionResource.Builder builder = OptionResource.builder();

		OptionResource optionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			optionResource.getOption(
				Long.valueOf(System.getProperty("optionId"))));
	}

}