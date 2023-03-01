import com.liferay.headless.commerce.admin.order.client.resource.v1_0.TermResource;

public class Term_GET_ById {

	/**
	 * java -classpath .:* -DtermId=1234 Term_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		TermResource.Builder builder = TermResource.builder();

		TermResource termResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			termResource.getTerm(Long.valueOf(System.getProperty("termId"))));
	}

}