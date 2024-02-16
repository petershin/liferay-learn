curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"label\": {\"en_US\": \"Foo\"}, \"name\": \"Foo\", \"pluralLabel\": {\"en_US\": \"Foos\"}, \"scope\": \"company\"}" \
	-u "test@liferay.com:learn"