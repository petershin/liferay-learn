curl \
	"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists" \
	--data-raw '
		{
			"catalogId": ${1},
			"currencyCode": "USD",
			"name": "Able",
			"type": "price-list"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"