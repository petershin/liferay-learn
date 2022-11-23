import com.liferay.object.admin.rest.client.resource.v1_0.ObjectFieldResource;

public class ObjectField_DELETE_ById {

	/**
	 * java -classpath .:* -DobjectFieldId=1234 ObjectField_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		ObjectFieldResource.Builder builder = ObjectFieldResource.builder();

		ObjectFieldResource objectFieldResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		objectFieldResource.deleteObjectField(
			Long.valueOf(System.getProperty("objectFieldId")));
	}

}