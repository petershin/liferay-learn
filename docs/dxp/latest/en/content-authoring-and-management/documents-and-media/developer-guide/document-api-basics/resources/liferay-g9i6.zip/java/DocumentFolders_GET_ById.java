import com.liferay.headless.delivery.client.resource.v1_0.DocumentFolderResource;

public class DocumentFolders_GET_ById {

	/**
	 * java -classpath .:* -DdocumentFolderId=1234 DocumentFolders_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		DocumentFolderResource.Builder builder =
			DocumentFolderResource.builder();

		DocumentFolderResource documentFolderResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentFolderResource.getDocumentFolder(
				Long.valueOf(System.getProperty("documentFolderId"))));
	}

}