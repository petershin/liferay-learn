import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingResource;

public class BlogPostings_GET_FromSites {

	/**
	 * java -classpath .:* -DsiteId=1234 BlogPostings_GET_FromSites
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingResource.Builder builder = BlogPostingResource.builder();

		BlogPostingResource blogPostingResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			blogPostingResource.getSiteBlogPostingsPage(
				Long.valueOf(System.getProperty("siteId")), null, null, null,
				Pagination.of(1, 2), null));
	}

}