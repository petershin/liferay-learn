curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions" \
	-d "{\"externalReferenceCode\": \"LIST_DISTRIBUTION_CHANNELS\", \"listTypeEntries\": [{\"externalReferenceCode\": \"CHANNEL_OTHER_RETAILERS\", \"key\": \"otherRetailers\", \"name\": \"Other Retailers\", \"name_i18n\": {\"en-US\": \"Distribute to Other Retailers\"}, \"type\": \"\"}, {\"externalReferenceCode\": \"CHANNEL_OWN_RETAIL\", \"key\": \"ownRetail\", \"name\": \"Own Retail\", \"name_i18n\": {\"en-US\": \"Sell Through Own Retail\"}, \"type\": \"\"}, {\"externalReferenceCode\": \"CHANNEL_E_COMMERCE\", \"key\": \"eCommerce\", \"name\": \"E-Commerce\", \"name_i18n\": {\"en-US\": \"E-Commerce\"}, \"type\": \"\"}],\"name\": \"Distribution Channels\", \"name_i18n\": {\"en-US\": \"Distribution Channels\"}}" \
	-u "test@liferay.com:learn"