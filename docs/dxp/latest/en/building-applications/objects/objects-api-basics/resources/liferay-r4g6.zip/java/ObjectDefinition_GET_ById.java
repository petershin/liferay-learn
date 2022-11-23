import com.liferay.object.admin.rest.client.resource.v1_0.ObjectDefinitionResource;

public class ObjectDefinition_GET_ById {

	/**
	 * java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		ObjectDefinitionResource.Builder builder =
			ObjectDefinitionResource.builder();

		ObjectDefinitionResource objectDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			objectDefinitionResource.getObjectDefinition(
				Long.valueOf(System.getProperty("objectDefinitionId"))));
	}

}