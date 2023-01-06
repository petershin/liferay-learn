import com.liferay.object.admin.rest.client.dto.v1_0.ObjectField;
import com.liferay.object.admin.rest.client.resource.v1_0.ObjectFieldResource;

import java.util.Collections;

public class ObjectField_PUT_ById {

	/**
	 * java -classpath .:* -DobjectFieldId=1234 ObjectField_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		ObjectFieldResource.Builder builder = ObjectFieldResource.builder();

		ObjectFieldResource objectFieldResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		ObjectField objectField = objectFieldResource.putObjectField(
			Long.valueOf(System.getProperty("objectFieldId")),
			new ObjectField() {
				{
					businessType = ObjectField.BusinessType.create("Text");
					label = Collections.singletonMap("en_US", "Charlie");
					name = "charlie";
					required = false;
				}
			});

		System.out.println(objectField);
	}

}