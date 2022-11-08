import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeDefinitionResource;

public class ListTypeDefinition_GET_ById {

	/**
	 * java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		ListTypeDefinitionResource.Builder builder =
			ListTypeDefinitionResource.builder();

		ListTypeDefinitionResource listTypeDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			listTypeDefinitionResource.getListTypeDefinition(
				Long.valueOf(System.getProperty("listTypeDefinitionId"))));
	}

}