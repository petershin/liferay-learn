import com.liferay.scim.rest.client.resource.v1_0.UserResource;

public class User_DELETE_ById {

	/**
	 * java -classpath .:* -DuserId=1234 User_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		UserResource.Builder builder = UserResource.builder();

		UserResource userResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		userResource.deleteV2User(String.valueOf(System.getProperty("userId")));
	}

}