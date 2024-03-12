import com.liferay.scim.rest.client.resource.v1_0.GroupResource;

public class Group_GET_ById {

	/**
	 * java -classpath .:* -DgroupId=1234 Group_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		GroupResource.Builder builder = GroupResource.builder();

		GroupResource groupResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			groupResource.getV2GroupById(
				String.valueOf(System.getProperty("groupId"))));
	}

}