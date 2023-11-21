import com.liferay.headless.admin.user.client.resource.v1_0.PostalAddressResource;

/**
 * java -classpath .:* -DorganizationId=1234 PostalAddresses_GET_FromOrganization
 */
public class PostalAddresses_GET_FromOrganization {

	public static void main(String[] args) throws Exception {
		PostalAddressResource.Builder builder = PostalAddressResource.builder();

		PostalAddressResource postalAddressResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			postalAddressResource.getOrganizationPostalAddressesPage(
				String.valueOf(System.getProperty("organizationId"))));
	}

}