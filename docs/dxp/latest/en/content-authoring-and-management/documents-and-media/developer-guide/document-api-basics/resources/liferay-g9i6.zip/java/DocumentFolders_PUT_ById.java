import com.liferay.headless.delivery.client.dto.v1_0.DocumentFolder;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentFolderResource;

public class DocumentFolders_PUT_ById {

	/**
	 * java -classpath .:* -documentFolderId=1234 DocumentFolders_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		DocumentFolderResource.Builder builder =
			DocumentFolderResource.builder();

		DocumentFolderResource documentFolderResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentFolderResource.putDocumentFolder(
				Long.valueOf(System.getProperty("documentFolderId")),
				new DocumentFolder() {
					{
						name = "Goo";
					}
				}));
	}

}