curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/user-groups/${1}" \
	--request "DELETE" \
	--user "test@liferay.com:learn"