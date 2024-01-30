import com.liferay.headless.delivery.client.dto.v1_0.ContentTemplate;
import com.liferay.headless.delivery.client.pagination.Page;
import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.ContentTemplateResource;

public class ContentTemplates_GET_FromSite {

	/**
	 * java -classpath .:* -DsiteId=1234 ContentTemplates_GET_FromSite
	 */
	public static void main(String[] args) throws Exception {
		ContentTemplateResource.Builder builder =
			ContentTemplateResource.builder();

		ContentTemplateResource contentTemplateResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		long siteId = Long.parseLong(System.getProperty("siteId"));

		Page<ContentTemplate> page =
			contentTemplateResource.getSiteContentTemplatesPage(
				siteId, null, null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}