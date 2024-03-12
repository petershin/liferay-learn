import com.liferay.scim.rest.client.dto.v1_0.MultiValuedAttribute;
import com.liferay.scim.rest.client.dto.v1_0.Name;
import com.liferay.scim.rest.client.dto.v1_0.User;
import com.liferay.scim.rest.client.resource.v1_0.UserResource;

public class User_POST_ToInstance {

	/**
	 * java -classpath .:* -DuserId=1234 User_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		UserResource.Builder builder = UserResource.builder();

		UserResource userResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		userResource.postV2User(
			new User() {
				{
					active = true;
					name = new Name() {
						{
							familyName = "Baker";
							givenName = "Able";
						}
					};
					emails = new MultiValuedAttribute[] {
						new MultiValuedAttribute() {
							{
								primary = true;
								type = "default";
								value = "able@liferay.com";
							}
						}
					};
					userName = "able.baker";
				}
			});
	}

}