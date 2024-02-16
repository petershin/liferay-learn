curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"fieldType\": \"select\", \"key\": \"foo\", \"name\": {\"en_US\": \"Foo\"}}" \
	-u "test@liferay.com:learn"