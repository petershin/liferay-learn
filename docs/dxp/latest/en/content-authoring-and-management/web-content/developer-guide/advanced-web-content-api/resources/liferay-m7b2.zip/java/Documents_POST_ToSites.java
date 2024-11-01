import com.liferay.headless.delivery.client.dto.v1_0.Document;
import com.liferay.headless.delivery.client.resource.v1_0.DocumentResource;

import java.io.File;

import java.util.HashMap;

public class Documents_POST_ToSites {

	/**
	 * java -classpath .:* -DsiteId=1234 -DfilePath=5678 Documents_POST_ToSites
	 */
	public static void main(String[] args) throws Exception {
		DocumentResource.Builder builder = DocumentResource.builder();

		DocumentResource documentResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			documentResource.postSiteDocument(
				Long.valueOf(System.getProperty("siteId")), new Document(),
				new HashMap<String, File>() {
					{
						put("file", new File(System.getProperty("filePath")));
					}
				}));
	}

}