import com.liferay.headless.delivery.client.dto.v1_0.ContentField;
import com.liferay.headless.delivery.client.dto.v1_0.ContentFieldValue;
import com.liferay.headless.delivery.client.dto.v1_0.StructuredContent;
import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructuredContents_POST_ToSites {

	/**
	 * java -classpath .:* -DcontentStructureId=1234 -DsiteId=5678 StructuredContents_POST_ToSites
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
					setContentFieldValue(
						new ContentFieldValue() {
							{
								setData("Goo");
							}
						});
					setName("Content");
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
						setTitle("Goo Article Java");
					}
				}));
	}

}