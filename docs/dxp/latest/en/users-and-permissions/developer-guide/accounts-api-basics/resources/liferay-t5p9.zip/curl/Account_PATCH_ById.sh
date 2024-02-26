curl \
	"http://localhost:8080/o/headless-admin--userser/v1.0/accounts/${1}" \
	--data-raw '
		{
			"description": "Bar"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH"	 \
	--user "test@liferay.com:learn"