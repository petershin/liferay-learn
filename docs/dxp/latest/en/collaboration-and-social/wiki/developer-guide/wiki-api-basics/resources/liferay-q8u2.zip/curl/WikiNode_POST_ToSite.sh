curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/wiki-nodes" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"description\": \"Foo\", \"name\": \"Able Node\"}" \
	-u "test@liferay.com:learn"