curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-groups/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"name\": \"Baker\"}" \
	-u "test@liferay.com:learn"