curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/specifications" \
	-d "{\"key\": \"foo\", \"title\": {\"en_US\": \"Foo\"}}" \
	-u "test@liferay.com:learn"