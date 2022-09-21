import com.liferay.headless.admin.user.client.resource.v1_0.RoleResource;

public class Role_GET_ById {

	/**
	 * java -classpath .:* -DroleId=1234 Role_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		RoleResource.Builder builder = RoleResource.builder();

		RoleResource roleResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			roleResource.getRole(Long.valueOf(System.getProperty("roleId"))));
	}

}