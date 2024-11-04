import com.liferay.headless.delivery.client.resource.v1_0.ContentTemplateResource;

public class ContentTemplates_GET_ById {

	/**
	 * java -classpath .:* -DcontentTemplateId=1234 -DsiteId=5678 ContentTemplates_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		ContentTemplateResource.Builder builder =
			ContentTemplateResource.builder();

		ContentTemplateResource contentTemplateResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			contentTemplateResource.getSiteContentTemplate(
				Long.valueOf(System.getProperty("siteId")),
				System.getProperty("contentTemplateId")));
	}

}