import com.liferay.headless.delivery.client.resource.v1_0.DocumentShortcutResource;

public class DocumentShortcuts_DELETE_ById {

	/**
	 * java -classpath .:* -DdocumentShortcutId=1234 DocumentShortcuts_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		DocumentShortcutResource.Builder builder =
			DocumentShortcutResource.builder();

		DocumentShortcutResource documentShortcutResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		documentShortcutResource.deleteDocumentShortcut(
			Long.valueOf(System.getProperty("documentShortcutId")));
	}

}