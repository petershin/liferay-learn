import com.liferay.headless.delivery.client.dto.v1_0.BlogPosting;
import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingResource;

public class BlogPostings_POST_ToSites {

	/**
	 * java -classpath .:* -DsiteId=1234 BlogPostings_POST_ToSites
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingResource.Builder builder = BlogPostingResource.builder();

		BlogPostingResource blogPostingResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			blogPostingResource.postSiteBlogPosting(
				Long.valueOf(System.getProperty("siteId")),
				new BlogPosting() {
					{
						articleBody = "Foo";
						headline = "Baker";
					}
				}));
	}

}