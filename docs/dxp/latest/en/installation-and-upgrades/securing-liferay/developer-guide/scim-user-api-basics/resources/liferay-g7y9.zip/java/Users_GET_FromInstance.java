import com.liferay.scim.rest.client.resource.v1_0.UserResource;

public class Users_GET_FromInstance {

	/**
	 * java -classpath .:* Users_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		UserResource.Builder builder = UserResource.builder();

		UserResource userResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(userResource.getV2Users(null, null));
	}

}