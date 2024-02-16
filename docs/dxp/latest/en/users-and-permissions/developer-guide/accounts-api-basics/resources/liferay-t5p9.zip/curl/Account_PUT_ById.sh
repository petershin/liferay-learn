curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "{\"description\": \"Goo\", \"name\": \"Baker\"}" \
	-u "test@liferay.com:learn"