curl \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	"http://localhost:8080/o/headless-admin-user/v1.0/postal-addresses/${1}" \
	-d "{\"streetAddressLine1\": \"456 Bar Ave\"}" \
	-u "test@liferay.com:learn"