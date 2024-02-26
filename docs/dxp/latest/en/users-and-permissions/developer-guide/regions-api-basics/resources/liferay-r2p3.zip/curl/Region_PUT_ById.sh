curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/regions/${1}" \
	--data-raw '
		{
			"name": "Goo",
			"regionCode": "ABL"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"