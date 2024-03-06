import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeDefinition;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeDefinitionResource;

import java.util.Collections;

public class ListTypeDefinition_POST_ToInstance {

	/**
	 * java -classpath .:* ListTypeDefinition_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		ListTypeDefinitionResource.Builder builder =
			ListTypeDefinitionResource.builder();

		ListTypeDefinitionResource listTypeDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		ListTypeDefinition listTypeDefinition =
			listTypeDefinitionResource.postListTypeDefinition(
				new ListTypeDefinition() {
					{
						name = "Foo";
						name_i18n = Collections.singletonMap("en_US", "Foo");
					}
				});

		System.out.println(listTypeDefinition);
	}

}