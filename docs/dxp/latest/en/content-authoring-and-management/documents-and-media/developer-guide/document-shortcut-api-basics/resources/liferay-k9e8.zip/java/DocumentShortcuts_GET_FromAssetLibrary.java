import com.liferay.headless.delivery.client.resource.v1_0.DocumentShortcutResource;

public class DocumentShortcuts_GET_FromAssetLibrary {

	/**
	 * java -classpath .:* -DassetLibraryId=1234 DocumentShortcuts_GET_FromAssetLibrary
	 */
	public static void main(String[] args) throws Exception {
		DocumentShortcutResource.Builder builder =
			DocumentShortcutResource.builder();

		DocumentShortcutResource documentShortcutResource =
			builder.authentication(
				"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentShortcutResource.getAssetLibraryDocumentShortcutsPage(
				Long.valueOf(System.getProperty("assetLibraryId")), Pagination.of(1, 2)));
	}

}