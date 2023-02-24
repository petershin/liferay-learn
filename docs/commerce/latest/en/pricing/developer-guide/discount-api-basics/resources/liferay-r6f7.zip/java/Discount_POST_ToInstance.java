import com.liferay.headless.commerce.admin.pricing.client.dto.v2_0.Discount;
import com.liferay.headless.commerce.admin.pricing.client.resource.v2_0.DiscountResource;

public class Discount_POST_ToInstance {

	/**
	 * java -classpath .:* Discount_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		DiscountResource.Builder builder = DiscountResource.builder();

		DiscountResource discountResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			discountResource.postDiscount(
				new Discount() {
					{
                  level = "L1";
                  limitationType = "unlimited";
                  target = "products";
                  title = "Foo";
                  usePercentage = true;
					}
				}));
	}

}