import com.liferay.headless.admin.user.client.resource.v1_0.PostalAddressResource;

/**
 * java -classpath .:* -DaccountId=1234 PostalAddresses_GET_FromAccount
 */
public class PostalAddresses_GET_FromAccount {

	public static void main(String[] args) throws Exception {
		PostalAddressResource.Builder builder = PostalAddressResource.builder();

		PostalAddressResource postalAddressResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			postalAddressResource.getAccountPostalAddressesPage(
				Long.valueOf(System.getProperty("accountId"))));
	}

}