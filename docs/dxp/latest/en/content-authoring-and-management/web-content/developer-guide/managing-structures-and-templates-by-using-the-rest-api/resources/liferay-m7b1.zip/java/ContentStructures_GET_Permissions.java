import com.liferay.headless.delivery.client.pagination.Page;
import com.liferay.headless.delivery.client.permission.Permission;
import com.liferay.headless.delivery.client.resource.v1_0.ContentStructureResource;

public class ContentStructures_GET_Permissions {

	/**
	 * java -classpath .:* -DcontentStructureId=1234 ContentStructures_GET_Permissions
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

		Page<Permission> page =
			contentStructureResource.getContentStructurePermissionsPage(
				contentStructureId, null);

		System.out.println(page);
	}

}