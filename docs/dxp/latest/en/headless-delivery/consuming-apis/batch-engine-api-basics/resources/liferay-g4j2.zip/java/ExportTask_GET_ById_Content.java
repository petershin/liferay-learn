import com.liferay.headless.batch.engine.client.http.HttpInvoker;
import com.liferay.headless.batch.engine.client.resource.v1_0.ExportTaskResource;

import java.io.FileOutputStream;

public class ExportTask_GET_ById_Content {

	public static void main(String[] args) throws Exception {
		ExportTaskResource.Builder builder = ExportTaskResource.builder();

		ExportTaskResource exportTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		HttpInvoker.HttpResponse httpResponse =
			exportTaskResource.getExportTaskContentHttpResponse(
				Long.valueOf(args[0]));

		try (FileOutputStream fileOutputStream = new FileOutputStream(
				"export.zip")) {

			fileOutputStream.write(httpResponse.getBinaryContent());
		}
	}

}