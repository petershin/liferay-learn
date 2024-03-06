import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeEntry;
import com.liferay.headless.admin.list.type.client.pagination.Page;
import com.liferay.headless.admin.list.type.client.pagination.Pagination;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeEntryResource;

public class ListTypeEntries_GET_FromListTypeDefinition {

	/**
	 * java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeEntries_GET_FromListTypeDefinition
	 */
	public static void main(String[] args) throws Exception {
		ListTypeEntryResource.Builder builder = ListTypeEntryResource.builder();

		ListTypeEntryResource listTypeEntryResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		Page<ListTypeEntry> page =
			listTypeEntryResource.getListTypeDefinitionListTypeEntriesPage(
				Long.valueOf(System.getProperty("listTypeDefinitionId")), null,
				null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}