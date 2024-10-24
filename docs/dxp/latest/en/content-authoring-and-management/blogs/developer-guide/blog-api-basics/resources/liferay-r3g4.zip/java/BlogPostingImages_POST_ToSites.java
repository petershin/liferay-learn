import com.liferay.headless.delivery.client.dto.v1_0.BlogPostingImage;
import com.liferay.headless.delivery.client.resource.v1_0.BlogPostingImageResource;

import java.io.File;

import java.util.HashMap;

public class BlogPostingImages_POST_ToSites {

	/**
	 * java -classpath .:* -DsiteId=1234 BlogPostingImages_POST_ToSites
	 */
	public static void main(String[] args) throws Exception {
		BlogPostingImageResource.Builder builder =
			BlogPostingImageResource.builder();

		BlogPostingImageResource blogPostingImageResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			blogPostingImageResource.postSiteBlogPostingImage(
				Long.valueOf(System.getProperty("siteId")),
				new BlogPostingImage(),
				new HashMap<String, File>() {
					{
						put("file", new File("liferay.png"));
					}
				}));
	}

}