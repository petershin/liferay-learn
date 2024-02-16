curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}/account-roles" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Charlie\"}" \
	-u "test@liferay.com:learn"