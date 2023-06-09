import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Product;
import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.ProductOption;
import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.Sku;
import com.liferay.headless.commerce.admin.catalog.client.dto.v1_0.SkuOption;
import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.ProductResource;

import java.util.HashMap;

public class Product_POST_ToCatalog {

	/**
	 * java -classpath .:* -DcatalogId=1234 -DoptionId=5678 Product_POST_ToCatalog
	 */
	public static void main(String[] args) throws Exception {
		ProductResource.Builder builder = ProductResource.builder();

		ProductResource productResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			productResource.postProduct(
				new Product() {
					{
						active = true;
						catalogId = Long.valueOf(
							System.getProperty("catalogId"));
						name = new HashMap<String, String>() {
							{
								put("en_US", "Foo");
							}
						};
						productOptions = new ProductOption[] {
							new ProductOption() {
								{
									fieldType = "select";
									key = "able";

									name = new HashMap<String, String>() {
										{
											put("en_US", "Able");
										}
									};
									optionId = Long.valueOf(
										System.getProperty("optionId"));
									required = true;
									skuContributor = true;
								}
							}
						};
						productType = "simple";
						skus = new Sku[] {
							new Sku() {
								{
									published = true;
									purchasable = true;
									sku = "SKU-01";
									skuOptions = new SkuOption[] {
										new SkuOption() {
											{
												key = "able";
												value = "Baker";
											}
										}
									};
								}
							},
							new Sku() {
								{
									published = true;
									purchasable = true;
									sku = "SKU-02";
									skuOptions = new SkuOption[] {
										new SkuOption() {
											{
												key = "able";
												value = "Charlie";
											}
										}
									};
								}
							}
						};
					}
				}));
	}

}