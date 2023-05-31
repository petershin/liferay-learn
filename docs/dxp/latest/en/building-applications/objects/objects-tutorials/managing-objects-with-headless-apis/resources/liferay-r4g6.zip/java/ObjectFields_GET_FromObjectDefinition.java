import com.liferay.object.admin.rest.client.dto.v1_0.ObjectField;
import com.liferay.object.admin.rest.client.pagination.Page;
import com.liferay.object.admin.rest.client.pagination.Pagination;
import com.liferay.object.admin.rest.client.resource.v1_0.ObjectFieldResource;

public class ObjectFields_GET_FromObjectDefinition {

	/**
	 * java -classpath .:* -DobjectDefinitionId=1234 ObjectFields_GET_FromObjectDefinition
	 */
	public static void main(String[] args) throws Exception {
		ObjectFieldResource.Builder builder = ObjectFieldResource.builder();

		ObjectFieldResource objectFieldResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Page<ObjectField> page =
			objectFieldResource.getObjectDefinitionObjectFieldsPage(
				Long.valueOf(System.getProperty("objectDefinitionId")), null,
				null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}