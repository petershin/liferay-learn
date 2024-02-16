curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/roles/${1}/association/user-account/${2}/site/${3}" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-u "test@liferay.com:learn"