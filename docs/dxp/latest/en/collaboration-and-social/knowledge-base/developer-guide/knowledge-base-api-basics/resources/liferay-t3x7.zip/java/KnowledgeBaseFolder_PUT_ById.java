import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseFolder;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseFolderResource;

public class KnowledgeBaseFolder_PUT_ById {

	/**
	 * java -classpath .:* -DknowledgeBaseFolderId=1234 KnowledgeBaseFolder_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseFolderResource.Builder builder =
			KnowledgeBaseFolderResource.builder();

		KnowledgeBaseFolderResource knowledgeBaseFolderResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		KnowledgeBaseFolder knowledgeBaseFolder =
			knowledgeBaseFolderResource.putKnowledgeBaseFolder(
				Long.valueOf(System.getProperty("knowledgeBaseFolderId")),
				new KnowledgeBaseFolder() {
					{
						description = "Goo";
						name = "Dog";
					}
				});

		System.out.println(knowledgeBaseFolder);
	}

}