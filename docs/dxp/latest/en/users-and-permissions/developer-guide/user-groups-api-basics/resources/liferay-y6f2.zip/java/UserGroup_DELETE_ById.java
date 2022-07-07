import com.liferay.headless.admin.user.client.resource.v1_0.UserGroupResource;

public class UserGroup_DELETE_ById {

	/**
	 * java -classpath .:* -DuserGroupId=1234 UserGroup_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		UserGroupResource.Builder builder = UserGroupResource.builder();

		UserGroupResource userGroupResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		userGroupResource.deleteUserGroup(
			Long.valueOf(System.getProperty("userGroupId")));
	}

}