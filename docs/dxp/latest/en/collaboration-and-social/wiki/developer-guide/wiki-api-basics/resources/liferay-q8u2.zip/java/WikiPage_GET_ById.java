import com.liferay.headless.delivery.client.resource.v1_0.WikiPageResource;

public class WikiPage_GET_ById {

	/**
	 * java -classpath .:* -DwikiPageId=1234 WikiPage_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		WikiPageResource.Builder builder = WikiPageResource.builder();

		WikiPageResource wikiPageResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			wikiPageResource.getWikiPage(
				Long.valueOf(System.getProperty("wikiPageId"))));
	}

}