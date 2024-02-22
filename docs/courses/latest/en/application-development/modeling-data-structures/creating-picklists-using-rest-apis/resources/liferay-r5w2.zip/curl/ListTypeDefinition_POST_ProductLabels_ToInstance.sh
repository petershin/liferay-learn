curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions" \
	--data-raw '
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
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"