curl \
	"http://localhost:8080/o/headless-admin-taxonomy/v1.0/sites/${1}/keywords" \
	--data-raw '
		{
			"name": "Foo"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"