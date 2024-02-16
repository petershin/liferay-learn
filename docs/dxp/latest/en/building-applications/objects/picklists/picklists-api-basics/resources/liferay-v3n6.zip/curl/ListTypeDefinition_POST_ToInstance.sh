curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": \"Foo\", \"name_i18n\": {\"en_US\": \"Foo\"}}" \
	-u "test@liferay.com:learn"