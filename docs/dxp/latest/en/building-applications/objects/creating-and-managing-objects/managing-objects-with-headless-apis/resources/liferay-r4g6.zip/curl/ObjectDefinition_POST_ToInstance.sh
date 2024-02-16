curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions" \
	-d "{\"label\": {\"en_US\": \"Foo\"}, \"name\": \"Foo\", \"pluralLabel\": {\"en_US\": \"Foos\"}, \"scope\": \"company\"}" \
	-u "test@liferay.com:learn"