import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingResource;

public class BlogPostings_DELETE_ById {

	/**
	 * java -classpath .:* -DblogPostingId=1234 BlogPostings_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingResource.Builder builder = BlogPostingResource.builder();

		BlogPostingResource blogPostingResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		blogPostingResource.deleteBlogPosting(
			Long.valueOf(System.getProperty("blogPostingId")));
	}

}