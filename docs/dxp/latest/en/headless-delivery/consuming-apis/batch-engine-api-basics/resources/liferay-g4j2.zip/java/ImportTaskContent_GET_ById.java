import com.liferay.headless.batch.engine.client.http.HttpInvoker;
import com.liferay.headless.batch.engine.client.resource.v1_0.ImportTaskResource;

import java.io.FileOutputStream;

public class ImportTaskContent_GET_ById {

	public static void main(String[] args) throws Exception {
		ImportTaskResource.Builder builder = ImportTaskResource.builder();

		ImportTaskResource importTaskResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		HttpInvoker.HttpResponse httpResponse =
			importTaskResource.getImportTaskContentHttpResponse(
				Long.valueOf(args[0]));

		try (FileOutputStream fileOutputStream = new FileOutputStream(
				"file.zip")) {

			fileOutputStream.write(httpResponse.getBinaryContent());
		}
	}

}