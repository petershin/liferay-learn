import com.liferay.headless.delivery.client.dto.v1_0.DocumentShortcut;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentShortcutResource;

public class DocumentShortcut_POST_ToAssetLibrary {

	/**
	 * java -classpath .:* -DassetLibraryId=1234 -DfolderId=1234 -DtargetDocumentId=1234 DocumentShortcut_POST_ToAssetLibrary
	 */
	public static void main(String[] args) throws Exception {
		DocumentShortcutResource.Builder builder = DocumentShortcutResource.builder();

		DocumentShortcutResource documentShortcutResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		DocumentShortcut documentShortcut = documentShortcutResource.postAssetLibraryDocumentShortcut(
			Long.valueOf(System.getProperty("assetLibraryId")),
			new DocumentShortcut() {{
				setFolderId(Long.valueOf(System.getProperty("folderId")));
				setTargetDocumentId(Long.valueOf(System.getProperty("targetDocumentId")));
			}}
		);

		System.out.println(documentShortcut);
	}

}