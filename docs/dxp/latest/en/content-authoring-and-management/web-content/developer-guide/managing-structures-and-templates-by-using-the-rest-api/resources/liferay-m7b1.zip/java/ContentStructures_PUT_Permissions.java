import com.liferay.headless.delivery.client.pagination.Page;
import com.liferay.headless.delivery.client.permission.Permission;
import com.liferay.headless.delivery.client.resource.v1_0.ContentStructureResource;

public class ContentStructures_PUT_Permissions {

	/**
	 * java -classpath .:* -DcontentStructureId=1234 -DactionIds="DELETE, UPDATE" -DroleName="Power User" ContentStructures_GET_Permissions
	 */
	public static void main(String[] args) throws Exception {
		ContentStructureResource.Builder builder =
			ContentStructureResource.builder();

		ContentStructureResource contentStructureResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		Page<Permission> page =
			contentStructureResource.putContentStructurePermissionsPage(
				Long.valueOf(System.getProperty("contentStructureId")),
				new Permission[] {
					new Permission() {
						{
							actionIds = System.getProperty(
								"actionIds"
							).split(
								"\\s*,\\s*"
							);
							roleName = System.getProperty("roleName");
						}
					}
				});

		System.out.println(page);
	}

}