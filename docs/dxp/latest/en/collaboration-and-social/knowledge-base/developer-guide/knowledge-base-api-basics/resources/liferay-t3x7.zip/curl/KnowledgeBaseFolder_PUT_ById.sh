curl \
	"http://localhost:8080/o/headless-delivery/v1.0/knowledge-base-folders/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "{\"description\": \"Goo\", \"name\": \"Baker\"}" \
	-u "test@liferay.com:learn"