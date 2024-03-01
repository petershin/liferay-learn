curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/currencies" \
	--data-raw '
		{
			"code": "AED",
			"name": {
				"en_US": "UAE Dirham"
			},
		 "rate": 3.67
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"