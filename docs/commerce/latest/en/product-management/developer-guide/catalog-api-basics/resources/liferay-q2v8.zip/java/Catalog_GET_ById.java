import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.CatalogResource;

public class Catalog_GET_ById {

	/**
	 * java -classpath .:* -DcatalogId=1234 Catalog_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		CatalogResource.Builder builder = CatalogResource.builder();

		CatalogResource catalogResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			catalogResource.getCatalog(
				Long.valueOf(System.getProperty("catalogId"))));
	}

}