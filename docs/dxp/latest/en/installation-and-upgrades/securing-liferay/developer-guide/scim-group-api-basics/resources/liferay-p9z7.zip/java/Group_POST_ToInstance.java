import com.liferay.scim.rest.client.dto.v1_0.MultiValuedAttribute;
import com.liferay.scim.rest.client.dto.v1_0.Name;
import com.liferay.scim.rest.client.dto.v1_0.Group;
import com.liferay.scim.rest.client.resource.v1_0.GroupResource;

public class Group_POST_ToInstance {

	/**
	 * java -classpath .:* -DgroupId=1234 Group_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		GroupResource.Builder builder = GroupResource.builder();

		GroupResource groupResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		groupResource.postV2Group(
			new Group() {
				{
					displayName = "Foo";
				}
			});
	}

}