import com.liferay.headless.admin.user.client.resource.v1_0.UserGroupResource;

public class UserGroup_GET_ById {

	/**
	 * java -classpath .:* -DuserGroupId=1234 UserGroup_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		UserGroupResource.Builder builder = UserGroupResource.builder();

		UserGroupResource userGroupResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			userGroupResource.getUserGroup(
				Long.valueOf(System.getProperty("userGroupId"))));
	}

}