import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeEntryResource;

public class ListTypeEntry_GET_ById {

	/**
	 * java -classpath .:* -DlistTypeEntryId=1234 ListTypeEntry_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		ListTypeEntryResource.Builder builder = ListTypeEntryResource.builder();

		ListTypeEntryResource listTypeEntryResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			listTypeEntryResource.getListTypeEntry(
				Long.valueOf(System.getProperty("listTypeEntryId"))));
	}

}