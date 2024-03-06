import com.liferay.object.admin.rest.client.dto.v1_0.ObjectDefinition;
import com.liferay.object.admin.rest.client.resource.v1_0.ObjectDefinitionResource;

import java.util.Collections;

public class ObjectDefinition_POST_ToInstance {

	/**
	 * java -classpath .:* ObjectDefinition_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		ObjectDefinitionResource.Builder builder =
			ObjectDefinitionResource.builder();

		ObjectDefinitionResource objectDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		ObjectDefinition objectDefinition =
			objectDefinitionResource.postObjectDefinition(
				new ObjectDefinition() {
					{
						label = Collections.singletonMap("en_US", "Foo");
						name = "Foo";
						pluralLabel = Collections.singletonMap("en_US", "Foos");
						scope = "company";
					}
				});

		System.out.println(objectDefinition);
	}

}