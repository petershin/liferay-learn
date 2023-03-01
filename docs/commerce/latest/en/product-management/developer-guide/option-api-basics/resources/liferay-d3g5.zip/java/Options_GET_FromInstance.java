import com.liferay.headless.commerce.admin.catalog.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.OptionResource;

public class Options_GET_FromInstance {

	/**
	 * java -classpath .:* Options_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		OptionResource.Builder builder = OptionResource.builder();

		OptionResource optionResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			optionResource.getOptionsPage(
				null, null, Pagination.of(1, 2), null));
	}

}