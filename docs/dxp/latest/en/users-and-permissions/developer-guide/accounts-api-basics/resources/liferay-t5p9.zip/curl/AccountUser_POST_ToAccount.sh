curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}/user-accounts" \
	--data-raw '
		{
			"alternateName": "Dog",
			"emailAddress": "dog@liferay.com",
			"familyName": "Easy",
			"givenName": "Dog"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"