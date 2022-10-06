import com.liferay.headless.batch.engine.client.dto.v1_0.ExportTask;
import com.liferay.headless.batch.engine.client.resource.v1_0.ExportTaskResource;

public class ExportTask_POST_BySiteId {

	public static void main(String[] args) throws Exception {
		ExportTaskResource.Builder builder = ExportTaskResource.builder();

		ExportTaskResource exportTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).parameter(
			"siteId", String.valueOf(System.getProperty("siteId"))
		).build();

		ExportTask exportTask = exportTaskResource.postExportTask(
			args[0], "json", "", "", "", "");

		System.out.println(exportTask);
	}

}