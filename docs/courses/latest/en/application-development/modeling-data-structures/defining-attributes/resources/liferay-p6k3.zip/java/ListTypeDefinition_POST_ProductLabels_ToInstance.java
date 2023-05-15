import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeDefinition;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeDefinitionResource;

import java.util.Collections;

public class ListTypeDefinition_POST_ProductLabels_ToInstance {

	/**
	 * java -classpath .:* ListTypeDefinition_POST_ProductLabels_ToInstance
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
					    "externalReferenceCode": "LIST_PRODUCT_LABELS",
					    "listTypeEntries": [
					        {
					            "externalReferenceCode": "LABEL_STANDARD_US",
					            "key": "standardUS",
					            "name": "Standard US",
					            "name_i18n": {
					                "en-US": "Standard US"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "LABEL_LOCALIZED",
					            "key": "localized",
					            "name": "Localized",
					            "name_i18n": {
					                "en-US": "Localized"
					            },
					            "type": ""
					        }
					    ],
					    "name": "Product Labels",
					    "name_i18n": {
					        "en-US": "Product Labels"
					    }
					}
				});

		System.out.println(listTypeDefinition);
	}

}