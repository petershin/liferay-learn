curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${1}/object-fields" \
	-d "{\"businessType\": \"Text\", \"indexed\": false, \"indexedAsKeyword\": false, \"label\": {\"en_US\": \"Able\"}, \"listTypeDefinitionId\": 0, \"name\": \"able\", \"required\": false}" \
	-u "test@liferay.com:learn"