import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingResource;

public class BlogPostings_PUT_Unsubscribe_BySiteId {

	/**
	 * java -classpath .:* -DsiteId=1234 BlogPostings_PUT_Unsubscribe_BySiteId
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingResource.Builder builder = BlogPostingResource.builder();

		BlogPostingResource blogPostingResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		blogPostingResource.putSiteBlogPostingUnsubscribe(
			Long.valueOf(System.getProperty("siteId")));
	}

}