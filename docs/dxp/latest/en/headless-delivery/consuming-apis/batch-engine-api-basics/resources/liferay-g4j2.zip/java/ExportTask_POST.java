import com.liferay.headless.batch.engine.client.dto.v1_0.ExportTask;
import com.liferay.headless.batch.engine.client.http.HttpInvoker;
import com.liferay.headless.batch.engine.client.resource.v1_0.ExportTaskResource;

import java.io.FileOutputStream;

public class ExportTask_POST {

	public static void main(String[] args) throws Exception {
		ExportTaskResource.Builder builder = ExportTaskResource.builder();

		ExportTaskResource exportTaskResource = builder.authentication(
			"test@liferay.com", "test1"
		).parameter(
			"siteId", String.valueOf(System.getProperty("siteId"))
		).build();

		ExportTask exportTask = exportTaskResource.postExportTask(
			args[0], "json", "", "", "", "");

		HttpInvoker.HttpResponse httpResponse =
			exportTaskResource.getExportTaskContentHttpResponse(
				exportTask.getId());

		FileOutputStream fileOutputStream = new FileOutputStream("export.zip");

		fileOutputStream.write(httpResponse.getBinaryContent());
		fileOutputStream.flush();
		fileOutputStream.close();
	}

}