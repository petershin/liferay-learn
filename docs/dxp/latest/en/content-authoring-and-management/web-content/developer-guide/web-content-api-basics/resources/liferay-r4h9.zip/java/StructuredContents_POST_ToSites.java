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

		System.out.println(
			structuredContentResource.postSiteStructuredContent(
				Long.valueOf(System.getProperty("siteId")),
				new StructuredContent() {
					{
						contentFields = _getContentFields();
						contentStructureId = Long.valueOf(
							System.getProperty("contentStructureId"));
						title = "Goo Article Java";
					}
				}));
	}

	private static ContentField[] _getContentFields() {
		return new ContentField[] {
			new ContentField() {
				{
					contentFieldValue = new ContentFieldValue() {
						{
							data = "Goo";
						}
					};
					name = "Content";
				}
			}
		};
	}

}