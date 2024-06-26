import com.liferay.headless.admin.user.client.pagination.Pagination;
import com.liferay.headless.admin.user.client.resource.v1_0.UserGroupResource;

public class UserGroups_GET_FromInstance {

	/**
	 * java -classpath .:* UserGroups_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		UserGroupResource.Builder builder = UserGroupResource.builder();

		UserGroupResource userGroupResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			userGroupResource.getUserGroupsPage(
				null, null, Pagination.of(1, 2), null));
	}

}