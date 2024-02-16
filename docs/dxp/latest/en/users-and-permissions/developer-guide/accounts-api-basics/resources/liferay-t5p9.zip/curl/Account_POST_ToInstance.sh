curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/accounts" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"description\": \"Foo\", \"name\": \"Able\"}" \
	-u "test@liferay.com:learn"