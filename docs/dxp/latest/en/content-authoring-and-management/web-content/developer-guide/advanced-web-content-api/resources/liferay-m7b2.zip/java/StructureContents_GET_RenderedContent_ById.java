import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructureContents_GET_RenderedContent_ById {

	/**
	 * java -classpath .:* -DstructuredContentId=1234 -DcontentTemplateId=5678 StructureContents_GET_RenderedContent_ById
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentResource.Builder builder =
			StructuredContentResource.builder();

		StructuredContentResource structuredContentResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			structuredContentResource.
				getStructuredContentRenderedContentContentTemplate(
					Long.valueOf(System.getProperty("structuredContentId")),
					System.getProperty("contentTemplateId")));
	}

}