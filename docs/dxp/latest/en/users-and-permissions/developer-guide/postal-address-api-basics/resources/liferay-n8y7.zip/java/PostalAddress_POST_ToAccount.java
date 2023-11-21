import com.liferay.headless.admin.user.client.dto.v1_0.PostalAddress;
import com.liferay.headless.admin.user.client.resource.v1_0.PostalAddressResource;

/**
 * java -classpath .:* -DaccountId=1234 PostalAddress_POST_ToAccount
 */
public class PostalAddress_POST_ToAccount {

	public static void main(String[] args) throws Exception {
		PostalAddressResource.Builder builder = PostalAddressResource.builder();

		PostalAddressResource postalAddressResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		PostalAddress postalAddress =
			postalAddressResource.postAccountPostalAddress(
				Long.valueOf(System.getProperty("accountId")),
				new PostalAddress() {
					{
						addressCountry = "United States";
						addressLocality = "Diamond Bar";
						addressRegion = "California";
						addressType = "billing";
						name = "Charlie Address";
						postalCode = "91765";
						primary = false;
						streetAddressLine1 = "123 Foo St";
						streetAddressLine2 = "";
						streetAddressLine3 = "";
					}
				});

		System.out.println(postalAddress);
	}

}