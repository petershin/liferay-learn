import com.liferay.headless.delivery.client.dto.v1_0.StructuredContent;
import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructuredContents_PATCH_ById {

	/**
	 * java -classpath .:* -DstructuredContentId=1234 StructuredContents_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentResource.Builder builder =
			StructuredContentResource.builder();

		StructuredContentResource structuredContentResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			structuredContentResource.patchStructuredContent(
				Long.valueOf(System.getProperty("structuredContentId")),
				new StructuredContent() {
					{
						setTitle("Charlie");
					}
				}));
	}

}