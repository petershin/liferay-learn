import com.liferay.headless.admin.user.client.resource.v1_0.UserAccountResource;

public class User_GET_ById {

	/**
	 * java -classpath .:* -DuserId=1234 User_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		UserAccountResource.Builder builder = UserAccountResource.builder();

		UserAccountResource userAccountResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			userAccountResource.getUserAccount(
				Long.valueOf(System.getProperty("userId"))));
	}

}