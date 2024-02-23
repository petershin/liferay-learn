curl \
	"http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms" \
	--data-raw '
		{
			"label": {
				"en_US": "Foo"
			},
			"name": "foo",
			"priority": 0,
			"type": "payment-terms"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"