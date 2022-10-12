import com.liferay.headless.batch.engine.client.resource.v1_0.ImportTaskResource;

public class ImportTask_POST_ToSite {

	/**
	 * java -classpath .:* -DsiteId=1234 -DclassName=able -Ddata=baker ImportTask_POST_ToSite
	 */
	public static void main(String[] args) throws Exception {
		ImportTaskResource.Builder builder = ImportTaskResource.builder();

		ImportTaskResource importTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).parameter(
			"siteId", String.valueOf(System.getProperty("siteId"))
		).build();

		System.out.println(
			importTaskResource.postImportTask(
				String.valueOf(System.getProperty("className")), null, null, null, null, null, null, String.valueOf(System.getProperty("data"))));
	}

}