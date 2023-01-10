import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Catalog;
import com.liferay.headless.commerce.admin.catalog.client.pagination.Page;
import com.liferay.headless.commerce.admin.catalog.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.CatalogResource;

public class Catalogs_GET_FromInstance {

	/**
	 * java -classpath .:* Catalogs_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		CatalogResource.Builder builder = CatalogResource.builder();

		CatalogResource catalogResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Page<Catalog> page = catalogResource.getCatalogsPage(
			null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}