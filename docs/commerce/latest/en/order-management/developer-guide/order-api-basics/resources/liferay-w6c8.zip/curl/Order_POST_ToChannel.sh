curl \
	"http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders" \
	--data-raw '
		{
			"accountId": "'"${1}"'",
			"channelId": "'"${2}"'",
			"currencyCode": "'"${3}"'"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"