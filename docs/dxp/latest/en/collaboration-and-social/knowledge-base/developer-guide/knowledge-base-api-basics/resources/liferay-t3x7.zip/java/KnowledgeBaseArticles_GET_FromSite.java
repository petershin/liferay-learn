import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseArticle;
import com.liferay.headless.delivery.client.pagination.Page;
import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseArticleResource;

public class KnowledgeBaseArticles_GET_FromSite {

	/**
	 * java -classpath .:* -DsiteId=1234 KnowledgeBaseArticles_GET_FromSite
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseArticleResource.Builder builder =
			KnowledgeBaseArticleResource.builder();

		KnowledgeBaseArticleResource knowledgeBaseArticleResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		Page<KnowledgeBaseArticle> page =
			knowledgeBaseArticleResource.getSiteKnowledgeBaseArticlesPage(
				Long.valueOf(System.getProperty("siteId")), null, null, null,
				null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}