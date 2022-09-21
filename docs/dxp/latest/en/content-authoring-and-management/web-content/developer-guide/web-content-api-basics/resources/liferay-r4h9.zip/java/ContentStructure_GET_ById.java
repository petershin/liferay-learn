import com.liferay.headless.delivery.client.resource.v1_0.ContentStructureResource;

public class ContentStructure_GET_ById {

	/**
	 * java -classpath .:* -DcontentStructureId=1234 ContentStructure_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		ContentStructureResource.Builder builder =
			ContentStructureResource.builder();

		ContentStructureResource contentStructureResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			contentStructureResource.getContentStructure(
				Long.valueOf(System.getProperty("contentStructureId"))));
	}

}