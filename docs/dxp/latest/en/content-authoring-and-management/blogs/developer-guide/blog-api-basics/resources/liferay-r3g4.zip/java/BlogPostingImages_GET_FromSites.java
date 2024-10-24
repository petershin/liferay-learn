import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingImageResource;

public class BlogPostingImages_GET_FromSites {

	/**
	 * java -classpath .:* -DsiteId=1234 BlogPostingImages_GET_FromSites
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingImageResource.Builder builder =
			BlogPostingImageResource.builder();

		BlogPostingImageResource blogPostingImageResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			blogPostingImageResource.getSiteBlogPostingImagesPage(
				Long.valueOf(System.getProperty("siteId")), null, null, null,
				Pagination.of(1, 2), null));
	}

}