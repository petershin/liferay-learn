import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeEntry;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeEntryResource;

import java.util.Collections;

public class ListTypeEntry_PUT_ById {

	/**
	 * java -classpath .:* -DlistTypeEntryId=1234 ListTypeEntry_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		ListTypeEntryResource.Builder builder = ListTypeEntryResource.builder();

		ListTypeEntryResource listTypeEntryResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		ListTypeEntry listTypeEntry = listTypeEntryResource.putListTypeEntry(
			Long.valueOf(System.getProperty("listTypeEntryId")),
			new ListTypeEntry() {
				{
					name = "Baker";
					name_i18n = Collections.singletonMap("en_US", "Baker");
				}
			});

		System.out.println(listTypeEntry);
	}

}