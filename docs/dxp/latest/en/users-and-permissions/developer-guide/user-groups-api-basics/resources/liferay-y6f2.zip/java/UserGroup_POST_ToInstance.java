import com.liferay.headless.admin.user.client.dto.v1_0.UserGroup;
import com.liferay.headless.admin.user.client.resource.v1_0.UserGroupResource;

public class UserGroup_POST_ToInstance {

	/**
	 * java -classpath .:* UserGroup_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		UserGroupResource.Builder builder = UserGroupResource.builder();

		UserGroupResource userGroupResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		UserGroup userGroup = userGroupResource.postUserGroup(
			new UserGroup() {
				{
					name = "Dog";
				}
			});

		System.out.println(userGroup);
	}

}