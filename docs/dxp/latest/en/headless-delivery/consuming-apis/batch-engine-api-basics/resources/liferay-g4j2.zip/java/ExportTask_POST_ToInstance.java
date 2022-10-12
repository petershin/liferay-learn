import com.liferay.headless.batch.engine.client.dto.v1_0.ExportTask;
import com.liferay.headless.batch.engine.client.resource.v1_0.ExportTaskResource;

public class ExportTask_POST_ToInstance {

	/**
	 * java -classpath .:* -DclassName=able ExportTask_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		ExportTaskResource.Builder builder = ExportTaskResource.builder();

		ExportTaskResource exportTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		ExportTask exportTask = exportTaskResource.postExportTask(
			String.valueOf(System.getProperty("className")), "json", null, null, null, "");

		System.out.println(exportTask);
	}

}