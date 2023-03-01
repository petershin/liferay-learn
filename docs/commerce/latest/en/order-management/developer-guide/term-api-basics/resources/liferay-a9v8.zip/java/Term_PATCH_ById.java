import com.liferay.headless.commerce.admin.order.client.dto.v1_0.Term;
import com.liferay.headless.commerce.admin.order.client.resource.v1_0.TermResource;

import java.util.HashMap;

public class Term_PATCH_ById {

	/**
	 * java -classpath .:* -DtermId=1234 Term_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		TermResource.Builder builder = TermResource.builder();

		TermResource termResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		termResource.patchTerm(
			Long.valueOf(System.getProperty("termId")),
			new Term() {
				{
					label = new HashMap<String, String>() {
						{
							put("en_US", "Bar");
						}
					};
				}
			});
	}

}