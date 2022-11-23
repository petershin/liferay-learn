import com.liferay.object.admin.rest.client.dto.v1_0.ObjectField;
import com.liferay.object.admin.rest.client.resource.v1_0.ObjectFieldResource;

import java.util.Collections;

public class ObjectField_PATCH_ById {

	/**
	 * java -classpath .:* -DobjectFieldId=1234 ObjectField_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		ObjectFieldResource.Builder builder = ObjectFieldResource.builder();

		ObjectFieldResource objectFieldResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		ObjectField objectField = objectFieldResource.patchObjectField(
			Long.valueOf(System.getProperty("objectFieldId")),
			new ObjectField() {
				{
					label = Collections.singletonMap("en_US", "Baker");
					name = "baker";
				}
			});

		System.out.println(objectField);
	}

}