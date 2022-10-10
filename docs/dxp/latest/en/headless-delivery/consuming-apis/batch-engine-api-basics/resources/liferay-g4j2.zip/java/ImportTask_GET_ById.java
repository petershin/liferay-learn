import com.liferay.headless.batch.engine.client.resource.v1_0.ImportTaskResource;

public class ImportTask_GET_ById {

	/**
	 * java -classpath .:* -DimportTaskId=1234 ImportTask_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		ImportTaskResource.Builder builder = ImportTaskResource.builder();

		ImportTaskResource importTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			importTaskResource.getImportTask(
				Long.valueOf(System.getProperty("importTaskId"))));
	}

}