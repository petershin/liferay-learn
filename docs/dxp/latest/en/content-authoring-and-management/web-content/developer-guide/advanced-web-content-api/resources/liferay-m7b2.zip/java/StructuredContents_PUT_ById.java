import com.liferay.headless.delivery.client.dto.v1_0.ContentDocument;
import com.liferay.headless.delivery.client.dto.v1_0.ContentField;
import com.liferay.headless.delivery.client.dto.v1_0.ContentFieldValue;
import com.liferay.headless.delivery.client.dto.v1_0.StructuredContent;
import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructuredContents_PUT_ById {

	/**
	 * java -classpath .:* -DcontentStructureId=1234 -DimageId=5678 -DstructuredContentId=91011 StructuredContents_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentResource.Builder builder =
			StructuredContentResource.builder();

		StructuredContentResource structuredContentResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		ContentDocument contentDocument = new ContentDocument() {
			{
				description = "This text describes Goo's image.";
				id = Long.valueOf(System.getProperty("imageId"));
			}
		};

		ContentField[] contentFields = {
			new ContentField() {
				{
					contentFieldValue = new ContentFieldValue() {
						{
							data = "This text describes Goo.";
						}
					};
					name = "TextReference";
				}
			},
			new ContentField() {
				{
					contentFieldValue = new ContentFieldValue() {
						{
							image = contentDocument;
						}
					};
					name = "ImageReference";
				}
			},
			new ContentField() {
				{
					contentFieldValue = new ContentFieldValue() {
						{
							data = "2021-08-30T00:00:00Z";
						}
					};
					name = "DateReference";
				}
			},
			new ContentField() {
				{
					contentFieldValue = new ContentFieldValue() {
						{
							data = "Goo";
						}
					};
					name = "SingleSelectionReference";
				}
			}
		};

		System.out.println(
			structuredContentResource.putStructuredContent(
				Long.valueOf(System.getProperty("structuredContentId")),
				new StructuredContent() {
					{
						contentFields = contentFields;
						contentStructureId = Long.valueOf(
							System.getProperty("contentStructureId"));
						title = "Baker";
					}
				}));
	}

}