curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/knowledge-base-folders" \
	-d "{\"description\": \"Foo\", \"name\": \"Able\"}" \
	-u "test@liferay.com:learn"