import com.liferay.scim.rest.client.resource.v1_0.GroupResource;

public class Group_DELETE_ById {

	/**
	 * java -classpath .:* -DgroupId=1234 Group_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		GroupResource.Builder builder = GroupResource.builder();

		GroupResource groupResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		groupResource.deleteV2Group(
			String.valueOf(System.getProperty("groupId")));
	}

}