import com.liferay.headless.admin.user.client.dto.v1_0.UserGroup;
import com.liferay.headless.admin.user.client.resource.v1_0.UserGroupResource;

public class UserGroup_PUT_ById {

	/**
	 * java -classpath .:* -DuserGroupId=1234 UserGroup_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		UserGroupResource.Builder builder = UserGroupResource.builder();

		UserGroupResource userGroupResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		UserGroup userGroup = userGroupResource.putUserGroup(
			Long.valueOf(System.getProperty("userGroupId")),
			new UserGroup() {
				{
					name = "Fox";
				}
			});

		System.out.println(userGroup);
	}

}