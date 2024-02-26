curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/postal-addresses/${1}" \
	--data-raw '
		{
			"streetAddressLine1": "456 Bar Ave"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"