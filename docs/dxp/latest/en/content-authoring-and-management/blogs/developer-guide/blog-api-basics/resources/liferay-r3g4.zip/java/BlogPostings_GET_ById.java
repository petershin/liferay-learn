import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingResource;

public class BlogPostings_GET_ById {

	/**
	 * java -classpath .:* -DblogPostingId=1234 BlogPostings_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingResource.Builder builder = BlogPostingResource.builder();

		BlogPostingResource blogPostingResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			blogPostingResource.getBlogPosting(
				Long.valueOf(System.getProperty("blogPostingId"))));
	}

}