curl \
	"http://localhost:8080/o/headless-commerce-admin-order/v1.0/order-types" \
	--data-raw '
		{
			"name": {
				"en_US": "Foo"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"