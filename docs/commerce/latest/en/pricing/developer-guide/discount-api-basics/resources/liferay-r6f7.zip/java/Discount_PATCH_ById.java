import com.liferay.headless.commerce.admin.pricing.client.dto.v2_0.Discount;
import com.liferay.headless.commerce.admin.pricing.client.resource.v2_0.DiscountResource;

public class Discount_PATCH_ById {

	/**
	 * java -classpath .:* -DdiscountId=1234 Discount_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		DiscountResource.Builder builder = DiscountResource.builder();

		DiscountResource discountResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		discountResource.patchDiscount(
			Long.valueOf(System.getProperty("discountId")),
			new Discount() {
				{
					limitationType = "unlimited";
					target = "subtotal";
					title = "Bar";
				}
			});
	}

}