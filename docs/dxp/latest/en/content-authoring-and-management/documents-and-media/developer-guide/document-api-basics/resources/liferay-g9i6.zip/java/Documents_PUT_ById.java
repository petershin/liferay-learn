import com.liferay.headless.delivery.client.dto.v1_0.Document;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentResource;

import java.io.File;

import java.util.HashMap;

public class Documents_PUT_ById {

	/**
	 * java -classpath .:* -DdocumentId=1234 Documents_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		DocumentResource.Builder builder = DocumentResource.builder();

		DocumentResource documentResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentResource.putDocument(
				Long.valueOf(System.getProperty("documentId")),
				new Document() {
					{
						description = "Goo";
						title = "Documents_PUT_ById.java";
					}
				},
				new HashMap<String, File>() {
					{
						put("file", new File("Documents_PUT_ById.java"));
					}
				}));
	}

}