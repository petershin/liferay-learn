curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-groups" \
	--data-raw '
		{
			"name": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"