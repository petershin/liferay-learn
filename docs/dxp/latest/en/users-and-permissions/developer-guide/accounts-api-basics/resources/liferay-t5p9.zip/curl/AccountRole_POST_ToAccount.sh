curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}/account-roles" \
	--data-raw '
		{
			"name": "Charlie"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"