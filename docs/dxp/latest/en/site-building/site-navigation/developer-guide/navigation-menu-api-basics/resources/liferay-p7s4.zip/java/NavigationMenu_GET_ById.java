import com.liferay.headless.delivery.client.resource.v1_0.NavigationMenuResource;

public class NavigationMenu_GET_ById {

	/**
	 * java -classpath .:* -DnavigationMenuId=1234 NavigationMenu_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		NavigationMenuResource.Builder builder =
			NavigationMenuResource.builder();

		NavigationMenuResource navigationMenuResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			navigationMenuResource.getNavigationMenu(
				Long.valueOf(System.getProperty("navigationMenuId"))));
	}

}