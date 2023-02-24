import com.liferay.headless.commerce.admin.pricing.client.resource.v2_0.DiscountResource;

public class Discount_DELETE_ById {

	/**
	 * java -classpath .:* -DdiscountId=1234 Discount_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		DiscountResource.Builder builder = DiscountResource.builder();

		DiscountResource discountResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		discountResource.deleteDiscount(
			Long.valueOf(System.getProperty("discountId")));
	}

}