curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"description\": \"Bar\"}" \
	-u "test@liferay.com:learn"