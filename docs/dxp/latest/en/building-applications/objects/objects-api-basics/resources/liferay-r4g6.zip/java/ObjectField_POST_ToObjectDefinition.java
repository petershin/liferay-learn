import com.liferay.object.admin.rest.client.dto.v1_0.ObjectField;
import com.liferay.object.admin.rest.client.resource.v1_0.ObjectFieldResource;

import java.util.Collections;

public class ObjectField_POST_ToObjectDefinition {

	/**
	 * java -classpath .:* -DobjectDefinitionId=1234 ObjectField_POST_ToObjectDefinition
	 */
	public static void main(String[] args) throws Exception {
		ObjectFieldResource.Builder builder = ObjectFieldResource.builder();

		ObjectFieldResource objectFieldResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		ObjectField objectField =
			objectFieldResource.postObjectDefinitionObjectField(
				Long.valueOf(System.getProperty("objectDefinitionId")),
				new ObjectField() {
					{
						businessType = ObjectField.BusinessType.create("Text");
						label = Collections.singletonMap("en_US", "Able");
						name = "able";
						required = false;
					}
				});

		System.out.println(objectField);
	}

}