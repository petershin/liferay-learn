curl \
	"http://localhost:8080/o/headless-admin--userser/v1.0/accounts" \
	--data-raw '
		{
			"description": "Foo",
			"name": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"