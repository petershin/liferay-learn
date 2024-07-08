import com.liferay.headless.delivery.client.dto.v1_0.DocumentFolder;
import com.liferay.headless.delivery.client.pagination.Page;
import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentFolderResource;

public class DocumentFolders_GET_FromSite {

	/**
	 * java -classpath .:* -DsiteId=1234 DocumentFolders_GET_FromSite
	 */
	public static void main(String[] args) throws Exception {
		DocumentFolderResource.Builder builder =
			DocumentFolderResource.builder();

		DocumentFolderResource documentFolderResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentFolderResource.getSiteDocumentFoldersPage(
				Long.valueOf(System.getProperty("siteId")), null, null, null, null,
				Pagination.of(1, 2), null));
	}

}