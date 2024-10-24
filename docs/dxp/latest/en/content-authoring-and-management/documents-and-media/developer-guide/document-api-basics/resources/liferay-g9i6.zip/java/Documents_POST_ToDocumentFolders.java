import com.liferay.headless.delivery.client.dto.v1_0.Document;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentResource;

import java.io.File;

import java.util.HashMap;

public class Documents_POST_ToDocumentFolders {

	/**
	 * java -classpath .:* -DdocumentFolderId=1234 Documents_POST_ToDocumentFolders
	 */
	public static void main(String[] args) throws Exception {
		DocumentResource.Builder builder = DocumentResource.builder();

		DocumentResource documentResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentResource.postDocumentFolderDocument(
				Long.valueOf(System.getProperty("documentFolderId")),
				new Document(),
				new HashMap<String, File>() {
					{
						put(
							"file",
							new File("Documents_POST_ToDocumentFolders.java"));
					}
				}));
	}

}