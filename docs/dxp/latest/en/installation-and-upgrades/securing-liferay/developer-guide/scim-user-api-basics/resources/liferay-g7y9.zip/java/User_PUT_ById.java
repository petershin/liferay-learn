import com.liferay.scim.rest.client.dto.v1_0.MultiValuedAttribute;
import com.liferay.scim.rest.client.dto.v1_0.Name;
import com.liferay.scim.rest.client.dto.v1_0.User;
import com.liferay.scim.rest.client.resource.v1_0.UserResource;

public class User_PUT_ById {

	/**
	 * java -classpath .:* -DuserId=1234 User_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		UserResource.Builder builder = UserResource.builder();

		UserResource userResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		userResource.putV2User(
			String.valueOf(System.getProperty("userId")),
			new User() {
				{
					name = new Name() {
						{
							familyName = "Charlie";
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