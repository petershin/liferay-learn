import com.liferay.scim.rest.client.resource.v1_0.UserResource;

public class User_GET_ById {

	/**
	 * java -classpath .:* -DuserId=1234 User_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		UserResource.Builder builder = UserResource.builder();

		UserResource userResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			userResource.getV2UserById(
				String.valueOf(System.getProperty("userId"))));
	}

}