import com.liferay.headless.admin.user.client.resource.v1_0.PostalAddressResource;

/**
 * java -classpath .:* -DpostalAddressId=1234 PostalAddress_GET_ById
 */
public class PostalAddress_GET_ById {

	public static void main(String[] args) throws Exception {
		PostalAddressResource.Builder builder = PostalAddressResource.builder();

		PostalAddressResource postalAddressResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			postalAddressResource.getPostalAddress(
				Long.valueOf(System.getProperty("postalAddressId"))));
	}

}