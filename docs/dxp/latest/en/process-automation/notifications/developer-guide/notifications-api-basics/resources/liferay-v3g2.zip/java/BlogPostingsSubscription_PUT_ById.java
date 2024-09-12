import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingResource;

public class BlogPostingsSubscription_PUT_ById {

	/**
	 * java -classpath .:* -DsiteId=1234 BlogPostingsSubscription_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingResource.Builder builder =
			BlogPostingResource.builder();

		BlogPostingResource blogPostingResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		blogPostingResource.putSiteBlogPostingSubscribe(Long.valueOf(System.getProperty("siteId")));
	}

}