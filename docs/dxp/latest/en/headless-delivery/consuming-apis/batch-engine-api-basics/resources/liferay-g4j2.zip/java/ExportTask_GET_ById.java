import com.liferay.headless.batch.engine.client.resource.v1_0.ExportTaskResource;

public class ExportTask_GET_ById {

	/**
	 * java -classpath .:* -DexportTaskId=1234 ExportTask_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		ExportTaskResource.Builder builder = ExportTaskResource.builder();

		ExportTaskResource exportTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			exportTaskResource.getExportTask(
				Long.valueOf(System.getProperty("exportTaskId"))));
	}

}