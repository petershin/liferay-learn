curl \
	-H "Content-Type: application/json" \
	-X PUT \
	-d "[{\"actionIds\": [\"DELETE\", \"VIEW\"], \"roleName\": \"Power User\"}]" \
	"http://localhost:8080/o/headless-delivery/v1.0/content-structures/${1}/permissions" \
	-u "test@liferay.com:learn"