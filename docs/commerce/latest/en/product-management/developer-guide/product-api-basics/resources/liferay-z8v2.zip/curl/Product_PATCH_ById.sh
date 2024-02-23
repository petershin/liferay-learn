curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/${1}" \
	--data-raw '
		{
			"name": {
				"en_US": "Bar"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"