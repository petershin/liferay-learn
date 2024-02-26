curl \
	"http://localhost:8080/o/headless-admin-taxonomy/v1.0/keywords/${1}" \
	--data-raw '
		{
			"name": "Bar"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"