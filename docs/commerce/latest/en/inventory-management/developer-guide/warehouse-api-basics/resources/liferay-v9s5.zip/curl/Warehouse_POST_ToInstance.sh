curl \
	"http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses" \
	--data-raw '
		{
			"active": false,
			"name": {
				"en_US": "Foo"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"