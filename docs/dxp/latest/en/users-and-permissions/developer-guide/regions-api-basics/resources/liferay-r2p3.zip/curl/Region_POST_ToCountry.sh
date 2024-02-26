curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries/${1}/regions" \
	--data-raw '
		{
			"name": "Foo",
			"regionCode": "ABL"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"