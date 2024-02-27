curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products" \
	--data-raw '
		{
			"active": true,
			"catalogId": "'"${1}"'",
			"name": {
				"en_US": "Foo"
			},
			"productType": "simple"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"