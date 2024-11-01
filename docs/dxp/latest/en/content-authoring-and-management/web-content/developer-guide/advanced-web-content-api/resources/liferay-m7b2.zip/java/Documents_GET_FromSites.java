import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentResource;

public class Documents_GET_FromSites {

	/**
	 * java -classpath .:* -DsiteId=1234 Documents_GET_FromSites
	 */
	public static void main(String[] args) throws Exception {
		DocumentResource.Builder builder = DocumentResource.builder();

		DocumentResource documentResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentResource.getSiteDocumentsPage(
				Long.valueOf(System.getProperty("siteId")), null, null, null,
				null, Pagination.of(1, 2), null));
	}

}