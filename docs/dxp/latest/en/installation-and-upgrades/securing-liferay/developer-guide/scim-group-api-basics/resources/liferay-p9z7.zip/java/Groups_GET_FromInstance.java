import com.liferay.scim.rest.client.resource.v1_0.GroupResource;

public class Groups_GET_FromInstance {

	/**
	 * java -classpath .:* Groups_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		GroupResource.Builder builder = GroupResource.builder();

		GroupResource groupResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(groupResource.getV2Groups(null, null));
	}

}