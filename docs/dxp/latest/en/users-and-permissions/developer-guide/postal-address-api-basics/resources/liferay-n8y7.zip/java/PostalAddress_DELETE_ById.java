import com.liferay.headless.admin.user.client.resource.v1_0.PostalAddressResource;

/**
 * java -classpath .:* -DpostalAddressId=1234 PostalAddress_DELETE_ById
 */
public class PostalAddress_DELETE_ById {

	public static void main(String[] args) throws Exception {
		PostalAddressResource.Builder builder = PostalAddressResource.builder();

		PostalAddressResource postalAddressResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		postalAddressResource.deletePostalAddress(
			Long.valueOf(System.getProperty("postalAddressId")));
	}

}