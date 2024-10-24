import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentFolderResource;

public class DocumentFolders_GET_FromAssetLibraries {

	/**
	 * java -classpath .:* -DassetLibraryId=1234 DocumentFolders_GET_FromAssetLibraries
	 */
	public static void main(String[] args) throws Exception {
		DocumentFolderResource.Builder builder =
			DocumentFolderResource.builder();

		DocumentFolderResource documentFolderResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentFolderResource.getAssetLibraryDocumentFoldersPage(
				Long.valueOf(System.getProperty("assetLibraryId")), null, null,
				null, null, Pagination.of(1, 2), null));
	}

}