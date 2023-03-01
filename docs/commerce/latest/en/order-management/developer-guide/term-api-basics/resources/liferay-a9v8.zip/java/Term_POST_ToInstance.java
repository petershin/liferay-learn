import com.liferay.headless.commerce.admin.order.client.dto.v1_0.Term;
import com.liferay.headless.commerce.admin.order.client.resource.v1_0.TermResource;

import java.util.HashMap;

public class Term_POST_ToInstance {

	/**
	 * java -classpath .:* Term_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		TermResource.Builder builder = TermResource.builder();

		TermResource termResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			termResource.postTerm(
				new Term() {
					{
						label = new HashMap<String, String>() {
							{
								put("en_US", "Bar");
							}
						};
						name = "bar";
						priority = 1D;
						type = "payment-terms";
					}
				}));
	}

}