curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-accounts" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"alternateName\": \"Able\", \"emailAddress\": \"able@liferay.com\", \"familyName\": \"Foo\", \"givenName\": \"Able\"}" \
	-u "test@liferay.com:learn"