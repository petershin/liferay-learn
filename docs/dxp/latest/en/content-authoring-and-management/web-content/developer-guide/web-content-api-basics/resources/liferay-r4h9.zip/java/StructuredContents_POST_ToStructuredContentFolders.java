import com.liferay.headless.delivery.client.dto.v1_0.ContentField;
import com.liferay.headless.delivery.client.dto.v1_0.ContentFieldValue;
import com.liferay.headless.delivery.client.dto.v1_0.StructuredContent;
import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructuredContents_POST_ToStructuredContentFolders {

	/**
	 * java -classpath .:* -DcontentStructureId=1234 -DstructuredContentFolder=5678 StructuredContents_POST_ToStructuredContentFolders
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentResource.Builder builder =
			StructuredContentResource.builder();

		StructuredContentResource structuredContentResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		ContentField[] contentFields = {
			new ContentField() {
				{
					setName("content");
					setContentFieldValue(
						new ContentFieldValue() {
							{
								setData("<p>Foo</p>");
							}
						});
				}
			}
		};

		System.out.println(
			structuredContentResource.
				postStructuredContentFolderStructuredContent(
					Long.valueOf(System.getProperty("structuredContentFolder")),
					new StructuredContent() {
						{
							setContentFields(contentFields);
							setContentStructureId(
								Long.valueOf(
									System.getProperty("contentStructureId")));
							setTitle("Easy Article");
						}
					}));
	}

}