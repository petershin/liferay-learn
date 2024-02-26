curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-groups/${1}" \
	--data-raw '
		{
			"name": "Charlie"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"