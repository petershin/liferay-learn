import com.liferay.headless.commerce.admin.order.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.order.client.resource.v1_0.TermResource;

public class Terms_GET_FromInstance {

	/**
	 * java -classpath .:* Terms_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		TermResource.Builder builder = TermResource.builder();

		TermResource termResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			termResource.getTermsPage(null, null, Pagination.of(1, 2), null));
	}

}