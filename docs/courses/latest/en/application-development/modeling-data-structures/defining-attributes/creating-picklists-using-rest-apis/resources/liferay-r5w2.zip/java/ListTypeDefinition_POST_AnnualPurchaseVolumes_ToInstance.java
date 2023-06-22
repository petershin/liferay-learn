import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeDefinition;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeDefinitionResource;

import java.util.Collections;

public class ListTypeDefinition_POST_AnnualPurchaseVolumes_ToInstance {

	/**
	 * java -classpath .:* ListTypeDefinition_POST_AnnualPurchaseVolumes_ToInstance
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
					   "externalReferenceCode": "LIST_ANNUAL_PURCHASE_VOLUMES",
					   "listTypeEntries": [
					       {
					           "externalReferenceCode": "VOLUME_FIRST_TIER",
					           "key": "firstTier",
					           "name": "First Tier",
					           "name_i18n": {
					               "en-US": "$50,000 - $100,000 USD"
					           },
					           "type": ""
					       },
					       {
					           "externalReferenceCode": "VOLUME_SECOND_TIER",
					           "key": "secondTier",
					           "name": "Second Tier",
					           "name_i18n": {
					               "en-US": "$200,000 - $500,000 USD"
					           },
					           "type": ""
					       },
					       {
					           "externalReferenceCode": "VOLUME_THIRD_TIER",
					           "key": "thirdTier",
					           "name": "Third Tier",
					           "name_i18n": {
					               "en-US": "$500,000 - $1M USD"
					           },
					           "type": ""
					       },
					       {
					           "externalReferenceCode": "VOLUME_FOURTH_TIER",
					           "key": "fourthTier",
					           "name": "Fourth Tier",
					           "name_i18n": {
					               "en-US": "$1M+ USD"
					           },
					           "type": ""
					       }
					   ],
					   "name": "Annual Purchase Volumes",
					   "name_i18n": {
					       "en-US": "Annual Purchase Volumes"
					   }
					}
				});

		System.out.println(listTypeDefinition);
	}

}
