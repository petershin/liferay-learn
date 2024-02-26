curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-accounts" \
	--data-raw '
		{
			"alternateName": "Able",
			"emailAddress": "able@liferay.com",
			"familyName": "Foo",
			"givenName": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"