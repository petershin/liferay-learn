import com.liferay.headless.admin.user.client.dto.v1_0.PostalAddress;
import com.liferay.headless.admin.user.client.resource.v1_0.PostalAddressResource;

/**
 * java -classpath .:* -DpostalAddressId=1234 PostalAddress_PATCH_ById
 */
public class PostalAddress_PATCH_ById {

	public static void main(String[] args) throws Exception {
		PostalAddressResource.Builder builder = PostalAddressResource.builder();

		PostalAddressResource postalAddressResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		PostalAddress postalAddress = postalAddressResource.patchPostalAddress(
			Long.valueOf(System.getProperty("postalAddressId")),
			new PostalAddress() {
				{
					streetAddressLine1 = "456 Bar Ave";
				}
			});

		System.out.println(postalAddress);
	}

}