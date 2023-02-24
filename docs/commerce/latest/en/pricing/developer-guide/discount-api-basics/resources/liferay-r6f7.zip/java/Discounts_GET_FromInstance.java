import com.liferay.headless.commerce.admin.pricing.client.dto.v2_0.Discount;
import com.liferay.headless.commerce.admin.pricing.client.pagination.Page;
import com.liferay.headless.commerce.admin.pricing.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.pricing.client.resource.v2_0.DiscountResource;

public class Discounts_GET_FromInstance {

	/**
	 * java -classpath .:* Discounts_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		DiscountResource.Builder builder = DiscountResource.builder();

		DiscountResource discountResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Page<Discount> page = discountResource.getDiscountsPage(
			null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}