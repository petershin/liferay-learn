import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseArticle;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseArticleResource;

public class KnowledgeBaseArticle_POST_ToSite {

	/**
	 * java -classpath .:* -DsiteId=1234 KnowledgeBaseArticle_POST_ToSite
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseArticleResource.Builder builder =
			KnowledgeBaseArticleResource.builder();

		KnowledgeBaseArticleResource knowledgeBaseArticleResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		KnowledgeBaseArticle knowledgeBaseArticle =
			knowledgeBaseArticleResource.postSiteKnowledgeBaseArticle(
				Long.valueOf(System.getProperty("siteId")),
				new KnowledgeBaseArticle() {
					{
						articleBody = "Foo";
						title = "Charlie";
					}
				});

		System.out.println(knowledgeBaseArticle);
	}

}