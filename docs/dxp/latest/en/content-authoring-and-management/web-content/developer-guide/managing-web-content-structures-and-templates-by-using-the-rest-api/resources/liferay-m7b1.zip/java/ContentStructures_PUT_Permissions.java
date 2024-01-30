import com.liferay.headless.delivery.client.pagination.Page;
import com.liferay.headless.delivery.client.permission.Permission;
import com.liferay.headless.delivery.client.resource.v1_0.ContentStructureResource;

public class ContentStructures_PUT_Permissions {

	/**
	 * java -classpath .:* -DcontentStructureId=1234 -Dactions="DELETE, UPDATE" -Drole="Power User" ContentStructures_GET_Permissions
	 */
	public static void main(String[] args) throws Exception {
		ContentStructureResource.Builder builder =
			ContentStructureResource.builder();

		ContentStructureResource contentStructureResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		Long contentStructureId = Long.valueOf(
			System.getProperty("contentStructureId"));

		String actions = System.getProperty("actions");
		String role = System.getProperty("role");

		String[] actionIds = actions.split("\\s*,\\s*");

		Permission permission = new Permission();

		permission.setActionIds(actionIds);
		permission.setRoleName(role);

		Permission[] permissions = {permission};

		Page<Permission> page =
			contentStructureResource.putContentStructurePermissionsPage(
				contentStructureId, permissions);

		System.out.println(page);
	}

}