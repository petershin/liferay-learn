import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseArticle;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseArticleResource;

public class KnowledgeBaseArticle_PUT_ById {

	/**
	 * java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseArticleResource.Builder builder =
			KnowledgeBaseArticleResource.builder();

		KnowledgeBaseArticleResource knowledgeBaseArticleResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		KnowledgeBaseArticle knowledgeBaseArticle =
			knowledgeBaseArticleResource.putKnowledgeBaseArticle(
				Long.valueOf(System.getProperty("knowledgeBaseArticleId")),
				new KnowledgeBaseArticle() {
					{
						articleBody = "Goo";
						title = "Dog";
					}
				});

		System.out.println(knowledgeBaseArticle);
	}

}