import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseFolderResource;

public class KnowledgeBaseFolder_DELETE_ById {

	/**
	 * java -classpath .:* -DknowledgeBaseFolderId=1234 KnowledgeBaseFolder_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseFolderResource.Builder builder =
			KnowledgeBaseFolderResource.builder();

		KnowledgeBaseFolderResource knowledgeBaseFolderResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		knowledgeBaseFolderResource.deleteKnowledgeBaseFolder(
			Long.valueOf(System.getProperty("knowledgeBaseFolderId")));
	}

}