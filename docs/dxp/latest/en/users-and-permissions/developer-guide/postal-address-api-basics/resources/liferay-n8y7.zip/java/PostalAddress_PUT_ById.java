import com.liferay.headless.admin.user.client.dto.v1_0.PostalAddress;
import com.liferay.headless.admin.user.client.resource.v1_0.PostalAddressResource;

/**
 * java -classpath .:* -DpostalAddressId=1234 PostalAddress_PUT_ById
 */
public class PostalAddress_PUT_ById {

	public static void main(String[] args) throws Exception {
		PostalAddressResource.Builder builder = PostalAddressResource.builder();

		PostalAddressResource postalAddressResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		PostalAddress postalAddress = postalAddressResource.putPostalAddress(
			Long.valueOf(System.getProperty("postalAddressId")),
			new PostalAddress() {
				{
					addressCountry = "United States";
					addressLocality = "Diamond Bar";
					addressRegion = "California";
					addressType = "shipping";
					name = "Dog Address";
					postalCode = "67890";
					primary = false;
					streetAddressLine1 = "789 Goo Rd";
					streetAddressLine2 = "";
					streetAddressLine3 = "";
				}
			});

		System.out.println(postalAddress);
	}

}