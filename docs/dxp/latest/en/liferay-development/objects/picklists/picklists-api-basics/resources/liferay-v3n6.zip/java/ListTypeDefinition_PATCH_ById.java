import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeDefinition;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeDefinitionResource;

import java.util.Collections;

public class ListTypeDefinition_PATCH_ById {

	/**
	 * java -classpath .:* -DlistTypeDefinitionId=1234 ListTypeDefinition_PATCH_ById
	 */
	public static void main(String[] args) throws Exception {
		ListTypeDefinitionResource.Builder builder =
			ListTypeDefinitionResource.builder();

		ListTypeDefinitionResource listTypeDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		ListTypeDefinition listTypeDefinition =
			listTypeDefinitionResource.patchListTypeDefinition(
				Long.valueOf(System.getProperty("listTypeDefinitionId")),
				new ListTypeDefinition() {
					{
						name = "Bar";
						name_i18n = Collections.singletonMap("en_US", "Bar");
					}
				});

		System.out.println(listTypeDefinition);
	}

}