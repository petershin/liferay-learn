curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalogs" \
	--data-raw '
		{
			"currencyCode": "USD",
			"defaultLanguageId": "en_US",
			"name": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"