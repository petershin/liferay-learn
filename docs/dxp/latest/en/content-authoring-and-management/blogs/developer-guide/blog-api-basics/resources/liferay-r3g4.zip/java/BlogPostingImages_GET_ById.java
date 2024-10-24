import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingImageResource;

public class BlogPostingImages_GET_ById {

	/**
	 * java -classpath .:* -DblogPostingImageId=1234 BlogPostingImages_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingImageResource.Builder builder =
			BlogPostingImageResource.builder();

		BlogPostingImageResource blogPostingImageResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			blogPostingImageResource.getBlogPostingImage(
				Long.valueOf(System.getProperty("blogPostingImageId"))));
	}

}