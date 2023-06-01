import com.liferay.headless.commerce.admin.catalog.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.OptionValueResource;

public class OptionValues_GET_FromOption {

	/**
	 * java -classpath .:* -DoptionId=1234 OptionValues_GET_FromOption
	 */
	public static void main(String[] args) throws Exception {
		OptionValueResource.Builder builder = OptionValueResource.builder();

		OptionValueResource optionValueResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			optionValueResource.getOptionIdOptionValuesPage(
				Long.valueOf(System.getProperty("optionId")), null,
				Pagination.of(1, 2), null));
	}

}