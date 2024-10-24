import com.liferay.headless.delivery.client.resource.v1_0.DocumentShortcutResource;

public class DocumentShortcuts_GET_ById {

	/**
	 * java -classpath .:* -DdocumentShortcutId=1234 DocumentShortcuts_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		DocumentShortcutResource.Builder builder =
			DocumentShortcutResource.builder();

		DocumentShortcutResource documentShortcutResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			documentShortcutResource.getDocumentShortcut(
				Long.valueOf(System.getProperty("documentShortcutId"))));
	}

}