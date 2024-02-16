curl \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${1}" \
	-d "{\"label\": {\"en_US\": \"Bar\"}, \"name\": \"Bar\", \"pluralLabel\": {\"en_US\": \"Bars\"}}" \
	-u "test@liferay.com:learn"