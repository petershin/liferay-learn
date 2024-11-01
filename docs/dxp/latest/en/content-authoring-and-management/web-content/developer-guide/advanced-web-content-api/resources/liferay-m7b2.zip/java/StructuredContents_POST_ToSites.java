import com.liferay.headless.delivery.client.dto.v1_0.ContentDocument;
import com.liferay.headless.delivery.client.dto.v1_0.ContentField;
import com.liferay.headless.delivery.client.dto.v1_0.ContentFieldValue;
import com.liferay.headless.delivery.client.dto.v1_0.StructuredContent;
import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructuredContents_POST_ToSites {

	/**
	 * java -classpath .:* -DcontentStructureId=1234 -DsiteId=5678 -DimageId=91011 StructuredContents_POST_ToSites
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
				setDescription("This text describes Foo's image.");
				setId(Long.valueOf(System.getProperty("imageId")));
			}
		};

		ContentField[] contentFields = {
			new ContentField() {
				{
					setContentFieldValue(
						new ContentFieldValue() {
							{
								setData("This text describes Foo.");
							}
						});
					setName("TextReference");
				}
			},
			new ContentField() {
				{
					setContentFieldValue(
						new ContentFieldValue() {
							{
								setImage(contentDocument);
							}
						});
					setName("ImageReference");
				}
			},
			new ContentField() {
				{
					setContentFieldValue(
						new ContentFieldValue() {
							{
								setData("2021-08-30T00:00:00Z");
							}
						});
					setName("DateReference");
				}
			},
			new ContentField() {
				{
					setContentFieldValue(
						new ContentFieldValue() {
							{
								setData("Foo");
							}
						});
					setName("SingleSelectionReference");
				}
			}
		};

		System.out.println(
			structuredContentResource.postSiteStructuredContent(
				Long.valueOf(System.getProperty("siteId")),
				new StructuredContent() {
					{
						setContentFields(contentFields);
						setContentStructureId(
							Long.valueOf(
								System.getProperty("contentStructureId")));
						setTitle("Able");
					}
				}));
	}

}