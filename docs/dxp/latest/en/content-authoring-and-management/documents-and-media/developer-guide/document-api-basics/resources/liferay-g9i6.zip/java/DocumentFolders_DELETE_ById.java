import com.liferay.headless.delivery.client.resource.v1_0.DocumentFolderResource;

public class DocumentFolders_DELETE_ById {

	/**
	 * java -classpath .:* -DdocumentFolderId=1234 DocumentFolders_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		DocumentFolderResource.Builder builder =
			DocumentFolderResource.builder();

		DocumentFolderResource documentFolderResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		documentFolderResource.deleteDocumentFolder(
			Long.valueOf(System.getProperty("documentFolderId")));
	}

}