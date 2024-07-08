import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentShortcutResource;

public class DocumentShortcuts_GET_FromSite {

	/**
	 * java -classpath .:* -DsiteId=1234 DocumentShortcuts_GET_FromSite
	 */
	public static void main(String[] args) throws Exception {
		DocumentShortcutResource.Builder builder =
			DocumentShortcutResource.builder();

		DocumentShortcutResource documentShortcutResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			documentShortcutResource.getSiteDocumentShortcutsPage(
				Long.valueOf(System.getProperty("siteId")),
				Pagination.of(1, 2)));
	}

}