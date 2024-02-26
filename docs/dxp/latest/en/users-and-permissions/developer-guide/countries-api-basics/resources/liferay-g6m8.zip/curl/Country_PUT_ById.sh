curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries/${1}" \
	--data-raw '
		{
			"a2": "AB",
			"a3": "ABL",
			"name": "Goo",
			"number": "1234"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"