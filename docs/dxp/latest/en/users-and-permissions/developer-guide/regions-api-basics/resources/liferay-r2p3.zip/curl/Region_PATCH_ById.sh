curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/regions/${1}" \
	--data-raw '
		{
			"name": "Bar"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"