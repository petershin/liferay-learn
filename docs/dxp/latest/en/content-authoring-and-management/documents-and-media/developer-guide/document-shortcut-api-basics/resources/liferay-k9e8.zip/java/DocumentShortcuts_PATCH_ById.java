import com.liferay.headless.delivery.client.dto.v1_0.DocumentShortcut;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentShortcutResource;

public class DocumentShortcuts_PATCH_ById {

	/**
	 * java -classpath .:* -DdocumentShortcutId=1234 -DfolderId=1234 -DtargetDocumentId=1234 DocumentShortcuts_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		DocumentShortcutResource.Builder builder =
			DocumentShortcutResource.builder();

		DocumentShortcutResource documentShortcutResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		DocumentShortcut documentShortcut =
			documentShortcutResource.patchDocumentShortcut(
				Long.valueOf(System.getProperty("documentShortcutId")),
				new DocumentShortcut() {
					{
						setFolderId(
							() -> Long.valueOf(System.getProperty("folderId")));
						setTargetDocumentId(
							() -> Long.valueOf(
								System.getProperty("targetDocumentId")));
					}
				});

		System.out.println(documentShortcut);
	}

}