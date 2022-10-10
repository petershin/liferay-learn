import com.liferay.headless.batch.engine.client.resource.v1_0.ImportTaskResource;

public class ImportTask_PUT_ById {

	/**
	 * java -classpath .:* ImportTask_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		ImportTaskResource.Builder builder = ImportTaskResource.builder();

		ImportTaskResource importTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			importTaskResource.putImportTask(
				args[0], "", "", "", "", null, args[1]));
	}

}