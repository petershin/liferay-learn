import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseArticleResource;

public class KnowledgeBaseArticle_DELETE_ById {

	/**
	 * java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseArticleResource.Builder builder =
			KnowledgeBaseArticleResource.builder();

		KnowledgeBaseArticleResource knowledgeBaseArticleResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		knowledgeBaseArticleResource.deleteKnowledgeBaseArticle(
			Long.valueOf(System.getProperty("knowledgeBaseArticleId")));
	}

}