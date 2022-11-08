import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeDefinition;
import com.liferay.headless.admin.list.type.client.pagination.Page;
import com.liferay.headless.admin.list.type.client.pagination.Pagination;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeDefinitionResource;

public class ListTypeDefinitions_GET_FromInstance {

	/**
	 * java -classpath .:* ListTypeDefinitions_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		ListTypeDefinitionResource.Builder builder =
			ListTypeDefinitionResource.builder();

		ListTypeDefinitionResource listTypeDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		Page<ListTypeDefinition> page =
			listTypeDefinitionResource.getListTypeDefinitionsPage(
				null, null, null, Pagination.of(1, 2), null);

		System.out.println(page);
	}

}