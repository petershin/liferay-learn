import com.liferay.headless.delivery.client.dto.v1_0.Document;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentResource;

import java.io.File;

import java.util.HashMap;

public class Documents_PATCH_ById {

	/**
	 * java -classpath .:* -DdocumentId=1234 Documents_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		DocumentResource.Builder builder = DocumentResource.builder();

		DocumentResource documentResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentResource.patchDocument(
				Long.valueOf(System.getProperty("documentId")),
				new Document() {
					{
						description = "Bar";
					}
				},
				new HashMap<String, File>() {
					{
						put("file", new File("Document_POST_ToSite.java"));
					}
				}));
	}

}