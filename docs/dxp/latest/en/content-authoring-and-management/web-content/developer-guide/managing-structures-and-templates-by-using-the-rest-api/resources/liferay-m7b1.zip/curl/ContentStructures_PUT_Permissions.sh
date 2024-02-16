curl \
	"http://localhost:8080/o/headless-delivery/v1.0/content-structures/${1}/permissions" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "[{\"actionIds\": [\"DELETE\", \"VIEW\"], \"roleName\": \"Power User\"}]" \
	-u "test@liferay.com:learn"