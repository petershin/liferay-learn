curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/roles/${1}/association/user-account/${2}" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"