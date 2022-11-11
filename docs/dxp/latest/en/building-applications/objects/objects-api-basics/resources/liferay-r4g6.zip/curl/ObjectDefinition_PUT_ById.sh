curl \
	-H "Content-Type: application/json" \
	-X PUT \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${1}" \
	-d "{\"active\": false,	\"label\": {\"en_US\": \"Goo\"}, \"name\": \"Goo\", \"objectFields\": [], \"pluralLabel\": {\"en_US\": \"Goos\"}, \"portlet\": false, \"scope\": \"company\"}" \
	-u "test@liferay.com:learn"