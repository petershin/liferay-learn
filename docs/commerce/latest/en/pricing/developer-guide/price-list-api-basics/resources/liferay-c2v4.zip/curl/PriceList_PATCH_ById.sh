curl \
	"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/${1}" \
	--data-raw '
		{
			"name": "Baker"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"
