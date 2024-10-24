import com.liferay.headless.delivery.client.resource.v1_0.DocumentResource;

import java.util.Base64;

public class Documents_GET_ContentValue_ById {

	/**
	 * java -classpath .:* -DdocumentId=1234 Documents_GET_ContentValue_ById
	 */
	public static void main(String[] args) throws Exception {
		DocumentResource.Builder builder = DocumentResource.builder();

		builder.parameter("nestedFields", "contentValue");

		DocumentResource documentResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			new String(
				Base64.getDecoder(
				).decode(
					documentResource.getDocument(
						Long.valueOf(System.getProperty("documentId"))
					).getContentValue()
				)));
	}

}