import com.liferay.object.admin.rest.client.resource.v1_0.ObjectDefinitionResource;

public class ObjectDefinition_DELETE_ById {

	/**
	 * java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		ObjectDefinitionResource.Builder builder =
			ObjectDefinitionResource.builder();

		ObjectDefinitionResource objectDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		objectDefinitionResource.deleteObjectDefinition(
			Long.valueOf(System.getProperty("objectDefinitionId")));
	}

}