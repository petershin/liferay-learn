import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeDefinition;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeDefinitionResource;

import java.util.Collections;

public class ListTypeDefinition_POST_OrderTypes_ToInstance {

	/**
	 * java -classpath .:* ListTypeDefinition_POST_OrderTypes_ToInstance
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
					    "externalReferenceCode": "LIST_ORDER_TYPES",
					    "listTypeEntries": [
					        {
					            "externalReferenceCode": "ORDER_TYPE_WHOLESALE",
					            "key": "wholesale",
					            "name": "Wholesale",
					            "name_i18n": {
					                "en-US": "Wholesale"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "ORDER_TYPE_PRIVATE_LABELING",
					            "key": "privateLabeling",
					            "name": "Private Labeling",
					            "name_i18n": {
					                "en-US": "Private Labeling"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "ORDER_TYPE_BULK_FORMATS",
					            "key": "bulkFormats",
					            "name": "Bulk Formats",
					            "name_i18n": {
					                "en-US": "Bulk Formats"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "ORDER_TYPE_NOT_SURE",
					            "key": "notSure",
					            "name": "Not Sure",
					            "name_i18n": {
					                "en-US": "Not Sure"
					            },
					            "type": ""
					        }
					    ],
					    "name": "Order Types",
					    "name_i18n": {
					        "en-US": "Order Types"
					    }
					}
				});

		System.out.println(listTypeDefinition);
	}

}