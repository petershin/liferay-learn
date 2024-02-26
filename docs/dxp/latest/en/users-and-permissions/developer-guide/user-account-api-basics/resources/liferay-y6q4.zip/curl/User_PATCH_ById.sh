curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-accounts/${1}" \
	--data-raw '
		{
			"familyName": "Bar"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"