curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-groups/${1}" \
	--data-raw '
		{
			"name": "Baker"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"