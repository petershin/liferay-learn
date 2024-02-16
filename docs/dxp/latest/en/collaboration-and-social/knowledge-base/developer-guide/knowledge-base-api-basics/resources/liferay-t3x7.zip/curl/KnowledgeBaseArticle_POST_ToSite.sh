curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/knowledge-base-articles" \
	-d "{\"articleBody\": \"Foo\", \"title\": \"Able\"}" \
	-u "test@liferay.com:learn"