import com.liferay.headless.delivery.client.dto.v1_0.BlogPosting;
import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingResource;

public class BlogPostings_PATCH_ById {

	/**
	 * java -classpath .:* -DblogPostingId=1234 BlogPostings_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingResource.Builder builder = BlogPostingResource.builder();

		BlogPostingResource blogPostingResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			blogPostingResource.patchBlogPosting(
				Long.valueOf(System.getProperty("blogPostingId")),
				new BlogPosting() {
					{
						articleBody = "Bar";
					}
				}));
	}

}