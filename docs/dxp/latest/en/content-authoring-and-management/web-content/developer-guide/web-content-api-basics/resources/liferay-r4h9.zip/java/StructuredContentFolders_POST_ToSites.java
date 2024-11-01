import com.liferay.headless.delivery.client.dto.v1_0.StructuredContentFolder;
import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentFolderResource;

public class StructuredContentFolders_POST_ToSites {

	/**
	 * java -classpath .:* -DsiteId=1234 StructuredContentFolders_POST_ToSites
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentFolderResource.Builder builder =
			StructuredContentFolderResource.builder();

		StructuredContentFolderResource structuredContentFolderResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			structuredContentFolderResource.postSiteStructuredContentFolder(
				Long.valueOf(System.getProperty("siteId")),
				new StructuredContentFolder() {
					{
						description = "Foo";
						name = "Charlie Folder";
					}
				}));
	}

}