curl \
	"http://localhost:8080/o/object-admin/v1.0/object-fields/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"label\": {\"en_US\": \"Baker\"}, \"name\": \"baker\"}" \
	-u "test@liferay.com:learn"