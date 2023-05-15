import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeDefinition;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeDefinitionResource;

import java.util.Collections;

public class ListTypeDefinition_POST_DistributionChannels_ToInstance {

	/**
	 * java -classpath .:* ListTypeDefinition_POST_DistributionChannels_ToInstance
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
					    "externalReferenceCode": "LIST_DISTRIBUTION_CHANNELS",
					    "listTypeEntries": [
					        {
					            "externalReferenceCode": "CHANNEL_OTHER_RETAILERS",
					            "key": "otherRetailers",
					            "name": "Other Retailers",
					            "name_i18n": {
					                "en-US": "Distribute to Other Retailers"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "CHANNEL_OWN_RETAIL",
					            "key": "ownRetail",
					            "name": "Own Retail",
					            "name_i18n": {
					                "en-US": "Sell Through Own Retail"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "CHANNEL_E_COMMERCE",
					            "key": "eCommerce",
					            "name": "E-Commerce",
					            "name_i18n": {
					                "en-US": "E-Commerce"
					            },
					            "type": ""
					        }
					    ],
					    "name": "Distribution Channels",
					    "name_i18n": {
					        "en-US": "Distribution Channels"
					    }
					}
				});

		System.out.println(listTypeDefinition);
	}

}