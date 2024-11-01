import com.liferay.headless.delivery.client.dto.v1_0.StructuredContentFolder;
import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentFolderResource;

public class StructuredContentFolders_PATCH_ById {

	/**
	 * java -classpath .:* -DstructuredContentFolderId=1234 StructuredContentFolders_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentFolderResource.Builder builder =
			StructuredContentFolderResource.builder();

		StructuredContentFolderResource structuredContentFolderResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			structuredContentFolderResource.patchStructuredContentFolder(
				Long.valueOf(System.getProperty("structuredContentFolderId")),
				new StructuredContentFolder() {
					{
						description = "Bar";
					}
				}));
	}

}