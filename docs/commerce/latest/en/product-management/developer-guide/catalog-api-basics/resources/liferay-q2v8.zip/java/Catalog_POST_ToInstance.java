import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Catalog;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.CatalogResource;

public class Catalog_POST_ToInstance {

	/**
	 * java -classpath .:* Catalog_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		CatalogResource.Builder builder = CatalogResource.builder();

		CatalogResource catalogResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			catalogResource.postCatalog(
				new Catalog() {
					{
						currencyCode = "USD";
						defaultLanguageId = "en_US";
						name = "Able";
					}
				}));
	}

}