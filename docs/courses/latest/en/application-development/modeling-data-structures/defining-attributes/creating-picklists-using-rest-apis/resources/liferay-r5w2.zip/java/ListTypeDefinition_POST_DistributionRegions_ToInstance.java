import com.liferay.headless.admin.list.type.client.dto.v1_0.ListTypeDefinition;
import com.liferay.headless.admin.list.type.client.resource.v1_0.ListTypeDefinitionResource;

import java.util.Collections;

public class ListTypeDefinition_POST_DistributionRegions_ToInstance {

	/**
	 * java -classpath .:* ListTypeDefinition_POST_DistributionRegions_ToInstance
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
					    "externalReferenceCode": "LIST_DISTRIBUTION_REGIONS",
					    "listTypeEntries": [
					        {
					            "externalReferenceCode": "REGION_LATIN_AMERICA",
					            "key": "latinAmerica",
					            "name": "Latin America",
					            "name_i18n": {
					                "en-US": "Latin America"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "REGION_CARIBBEAN",
					            "key": "caribbean",
					            "name": "Caribbean",
					            "name_i18n": {
					                "en-US": "Caribbean"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "REGION_EASTERN_EUROPE",
					            "key": "easternEurope",
					            "name": "Eastern Europe",
					            "name_i18n": {
					                "en-US": "Eastern Europe"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "REGION_WESTERN_EUROPE",
					            "key": "westernEurope",
					            "name": "Western Europe",
					            "name_i18n": {
					                "en-US": "Western Europe"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "REGION_MIDDLE_EAST",
					            "key": "middleEast",
					            "name": "Middle East",
					            "name_i18n": {
					                "en-US": "Middle East"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "REGION_AFRICA",
					            "key": "africa",
					            "name": "Africa",
					            "name_i18n": {
					                "en-US": "Africa"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "REGION_CENTRAL_ASIA",
					            "key": "centralAsia",
					            "name": "Central Asia",
					            "name_i18n": {
					                "en-US": "Central Asia"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "REGION_ASIA_PACIFIC_RIM",
					            "key": "asiaPacificRim",
					            "name": "Asia and Pacific Rim",
					            "name_i18n": {
					                "en-US": "Asia & Pacific Rim"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "REGION_INDIA",
					            "key": "india",
					            "name": "India",
					            "name_i18n": {
					                "en-US": "India"
					            },
					            "type": ""
					        },
					        {
					            "externalReferenceCode": "REGION_NORTH_AMERICA",
					            "key": "northAmerica",
					            "name": "North America",
					            "name_i18n": {
					                "en-US": "North America"
					            },
					            "type": ""
					        }
					    ],
					    "name": "Distribution Regions",
					    "name_i18n": {
					        "en-US": "Distribution Regions"
					    }
					}
				});

		System.out.println(listTypeDefinition);
	}

}