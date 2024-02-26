curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries" \
	--data-raw '
		{
			"a2": "AB",
			"a3": "ABL",
			"name": "Foo",
			"number": "1234"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"