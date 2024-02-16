curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-groups" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Able\"}" \
	-u "test@liferay.com:learn"