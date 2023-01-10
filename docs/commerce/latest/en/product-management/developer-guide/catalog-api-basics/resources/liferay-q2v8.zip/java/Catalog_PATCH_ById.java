import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Catalog;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.CatalogResource;

public class Catalog_PATCH_ById {

	/**
	 * java -classpath .:* -DcatalogId=1234 Catalog_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		CatalogResource.Builder builder = CatalogResource.builder();

		CatalogResource catalogResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		catalogResource.patchCatalog(
			Long.valueOf(System.getProperty("catalogId")),
			new Catalog() {
				{
					name = "Bar";
				}
			});
	}

}