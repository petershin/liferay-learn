curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${1}" \
	-d "{\"label\": {\"en_US\": \"Goo\"}, \"name\": \"Goo\", \"pluralLabel\": {\"en_US\": \"Goos\"}, \"scope\": \"company\"}" \
	-u "test@liferay.com:learn"