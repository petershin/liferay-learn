import com.liferay.object.admin.rest.client.dto.v1_0.ObjectDefinition;
import com.liferay.object.admin.rest.client.pagination.Page;
import com.liferay.object.admin.rest.client.pagination.Pagination;
import com.liferay.object.admin.rest.client.resource.v1_0.ObjectDefinitionResource;

public class ObjectDefinitions_GET_FromInstance {

	/**
	 * java -classpath .:* ObjectDefinitions_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		ObjectDefinitionResource.Builder builder =
			ObjectDefinitionResource.builder();

		ObjectDefinitionResource objectDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		Page<ObjectDefinition> page =
			objectDefinitionResource.getObjectDefinitionsPage(
				null, null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}