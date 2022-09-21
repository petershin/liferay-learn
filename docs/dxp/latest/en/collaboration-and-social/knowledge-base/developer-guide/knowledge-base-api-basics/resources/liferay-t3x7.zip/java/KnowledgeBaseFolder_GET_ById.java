import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseFolderResource;

public class KnowledgeBaseFolder_GET_ById {

	/**
	 * java -classpath .:* -DknowledgeBaseFolderId=1234 KnowledgeBaseFolder_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseFolderResource.Builder builder =
			KnowledgeBaseFolderResource.builder();

		KnowledgeBaseFolderResource knowledgeBaseFolderResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			knowledgeBaseFolderResource.getKnowledgeBaseFolder(
				Long.valueOf(System.getProperty("knowledgeBaseFolderId"))));
	}

}