curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-accounts/${1}" \
	--data-raw '
		{
			"alternateName": "Able",
			"emailAddress": "able@liferay.com",
			"familyName": "Goo",
			"givenName": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"