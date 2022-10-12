import com.liferay.headless.batch.engine.client.resource.v1_0.ImportTaskResource;

public class ImportTask_PUT_ById {

	/**
	 * java -classpath .:* -DclassName=able -Ddata=baker ImportTask_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		ImportTaskResource.Builder builder = ImportTaskResource.builder();

		ImportTaskResource importTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			importTaskResource.putImportTask(
				String.valueOf(System.getProperty("className")), "", "", "", "",
				null, String.valueOf(System.getProperty("data"))));
	}

}