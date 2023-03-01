import com.liferay.headless.commerce.admin.order.client.resource.v1_0.TermResource;

public class Term_DELETE_ById {

	/**
	 * java -classpath .:* -DtermId=1234 Term_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		TermResource.Builder builder = TermResource.builder();

		TermResource termResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		termResource.deleteTerm(Long.valueOf(System.getProperty("termId")));
	}

}