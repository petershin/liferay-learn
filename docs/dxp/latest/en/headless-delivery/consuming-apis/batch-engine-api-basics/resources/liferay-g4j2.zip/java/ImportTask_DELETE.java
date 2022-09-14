import com.liferay.headless.batch.engine.client.resource.v1_0.ImportTaskResource;

public class ImportTask_DELETE {

	public static void main(String[] args) throws Exception {
		ImportTaskResource.Builder builder = ImportTaskResource.builder();

		ImportTaskResource importTaskResource = builder.authentication(
			"test@liferay.com", "test1"
		).build();

		String json = args[0];

		System.out.println(
			importTaskResource.deleteImportTask(
				args[1], null, null, null, null, json));
	}

}