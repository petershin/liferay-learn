curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions" \
	--data-raw '
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
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"