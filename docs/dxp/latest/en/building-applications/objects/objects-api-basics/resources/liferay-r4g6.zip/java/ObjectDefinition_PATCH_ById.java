import com.liferay.object.admin.rest.client.dto.v1_0.ObjectDefinition;
import com.liferay.object.admin.rest.client.resource.v1_0.ObjectDefinitionResource;

import java.util.Collections;

public class ObjectDefinition_PATCH_ById {

	/**
	 * java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		ObjectDefinitionResource.Builder builder =
			ObjectDefinitionResource.builder();

		ObjectDefinitionResource objectDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		ObjectDefinition objectDefinition =
			objectDefinitionResource.patchObjectDefinition(
				Long.valueOf(System.getProperty("objectDefinitionId")),
				new ObjectDefinition() {
					{
						label = Collections.singletonMap("en_US", "Bar");
						name = "Bar";
						pluralLabel = Collections.singletonMap("en_US", "Bars");
					}
				});

		System.out.println(objectDefinition);
	}

}