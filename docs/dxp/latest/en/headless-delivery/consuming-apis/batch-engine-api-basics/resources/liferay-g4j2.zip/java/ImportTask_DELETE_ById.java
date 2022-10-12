import com.liferay.headless.batch.engine.client.resource.v1_0.ImportTaskResource;

public class ImportTask_DELETE_ById {

	/**
	 * java -classpath .:* -DclassName=able -Ddata="baker" ImportTask_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		ImportTaskResource.Builder builder = ImportTaskResource.builder();

		ImportTaskResource importTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			importTaskResource.deleteImportTask(
				String.valueOf(System.getProperty("className")), null, null,
				null, null, String.valueOf(System.getProperty("data"))));
	}

}