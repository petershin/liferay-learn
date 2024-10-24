import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentResource;

public class Documents_GET_FromAssetLibraries {

	/**
	 * java -classpath .:* -DassetLibraryId=1234 Documents_GET_FromAssetLibraries
	 */
	public static void main(String[] args) throws Exception {
		DocumentResource.Builder builder = DocumentResource.builder();

		DocumentResource documentResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentResource.getAssetLibraryDocumentsPage(
				Long.valueOf(System.getProperty("assetLibraryId")), null, null,
				null, null, Pagination.of(1, 2), null));
	}

}