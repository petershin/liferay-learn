curl \
	-H "Content-Type: application/json" \
	-X PUT \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${1}" \
	-d "{\"businessType\": \"Text\", \"indexed\": false, \"indexedAsKeyword\": false, \"label\": {\"en_US\": \"Charlie\"}, \"listTypeDefinitionId\": 0, \"name\": \"charlie\", \"required\": false}" \
	-u "test@liferay.com:learn"