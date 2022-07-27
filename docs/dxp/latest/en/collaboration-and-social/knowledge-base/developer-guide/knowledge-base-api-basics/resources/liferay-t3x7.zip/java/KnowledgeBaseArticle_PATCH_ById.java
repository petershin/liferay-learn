import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseArticle;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseArticleResource;

public class KnowledgeBaseArticle_PATCH_ById {

	/**
	 * java -classpath .:* -DknowledgeBaseArticleId=1234 KnowledgeBaseArticle_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseArticleResource.Builder builder =
			KnowledgeBaseArticleResource.builder();

		KnowledgeBaseArticleResource knowledgeBaseArticleResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		KnowledgeBaseArticle knowledgeBaseArticle =
			knowledgeBaseArticleResource.patchKnowledgeBaseArticle(
				Long.valueOf(System.getProperty("knowledgeBaseArticleId")),
				new KnowledgeBaseArticle() {
					{
						articleBody = "Bar";
					}
				});

		System.out.println(knowledgeBaseArticle);
	}

}