curl \
	"http://localhost:8080/o/headless-admin--userser/v1.0/accounts/${1}" \
	--data-raw '
		{
			"description": "Goo",
			"name": "Baker"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"