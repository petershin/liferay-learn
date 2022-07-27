import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseFolder;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseFolderResource;

public class KnowledgeBaseFolder_POST_ToSite {

	/**
	 * java -classpath .:* -DsiteId=1234 KnowledgeBaseFolder_POST_ToSite
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseFolderResource.Builder builder =
			KnowledgeBaseFolderResource.builder();

		KnowledgeBaseFolderResource knowledgeBaseFolderResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		KnowledgeBaseFolder knowledgeBaseFolder =
			knowledgeBaseFolderResource.postSiteKnowledgeBaseFolder(
				Long.valueOf(System.getProperty("siteId")),
				new KnowledgeBaseFolder() {
					{
						description = "Foo";
						name = "Charlie";
					}
				});

		System.out.println(knowledgeBaseFolder);
	}

}