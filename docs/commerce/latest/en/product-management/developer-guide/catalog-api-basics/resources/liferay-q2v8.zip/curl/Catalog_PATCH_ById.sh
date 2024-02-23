curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalog/${1}" \
	--data-raw '
		{
			"name": "Bar"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"