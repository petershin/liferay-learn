import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructuredContents_DELETE_ById {

	/**
	 * java -classpath .:* -DstructuredContentId=1234 StructuredContents_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentResource.Builder builder =
			StructuredContentResource.builder();

		StructuredContentResource structuredContentResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		structuredContentResource.deleteStructuredContent(
			Long.valueOf(System.getProperty("structuredContentId")));
	}

}