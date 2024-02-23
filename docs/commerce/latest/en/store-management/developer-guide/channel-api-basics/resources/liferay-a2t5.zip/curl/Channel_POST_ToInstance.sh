curl \
	"http://localhost:8080/o/headless-commerce-admin-channel/v1.0/channels" \
	--data-raw '
		{
			"currencyCode": "USD",
			"name": "Foo",
			"type": "site"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"