import com.liferay.headless.delivery.client.dto.v1_0.ContentField;
import com.liferay.headless.delivery.client.dto.v1_0.ContentFieldValue;
import com.liferay.headless.delivery.client.dto.v1_0.StructuredContent;
import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructuredContents_PUT_ById {

	/**
	 * java -classpath .:* -DcontentStructureId=1234 -DstructuredContentId=5678 StructuredContents_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentResource.Builder builder =
			StructuredContentResource.builder();

		StructuredContentResource structuredContentResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			structuredContentResource.putStructuredContent(
				Long.valueOf(System.getProperty("structuredContentId")),
				new StructuredContent() {
					{
						contentFields = _getContentFields();
						contentStructureId = Long.valueOf(
							System.getProperty("contentStructureId"));
						title = "Bar Article";
					}
				}));
	}

	private static ContentField[] _getContentFields() {
		return new ContentField[] {
			new ContentField() {
				{
					name = "Content";
					contentFieldValue = new ContentFieldValue() {
						{
							data = "Bar";
						}
					};
				}
			}
		};
	}

}