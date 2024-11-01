import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructuredContents_GET_ById {

	/**
	 * java -classpath .:* -DstructuredContentId=1234 StructuredContents_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentResource.Builder builder =
			StructuredContentResource.builder();

		StructuredContentResource structuredContentResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			structuredContentResource.getStructuredContent(
				Long.valueOf(System.getProperty("structuredContentId"))));
	}

}