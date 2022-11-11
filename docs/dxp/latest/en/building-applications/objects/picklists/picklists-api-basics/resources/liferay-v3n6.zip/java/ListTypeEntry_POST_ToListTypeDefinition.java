import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeEntry;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeEntryResource;

import java.util.Collections;

public class ListTypeEntry_POST_ToListTypeDefinition {

	/**
	 * java -classpath .:* -DlistTypeEntryId=1234 ListTypeEntry_POST_ToListTypeDefinition
	 */
	public static void main(String[] args) throws Exception {
		ListTypeEntryResource.Builder builder = ListTypeEntryResource.builder();

		ListTypeEntryResource listTypeEntryResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		ListTypeEntry listTypeEntry =
			listTypeEntryResource.postListTypeDefinitionListTypeEntry(
				Long.valueOf(System.getProperty("listTypeEntryId")),
				new ListTypeEntry() {
					{
						key = "able";
						name = "Able";
						name_i18n = Collections.singletonMap("en_US", "Able");
					}
				});

		System.out.println(listTypeEntry);
	}

}