curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/object-admin/v1.0/object-fields/${1}" \
	-d "{\"businessType\": \"Text\", \"label\": {\"en_US\": \"Charlie\"}, \"name\": \"charlie\", \"required\": false}" \
	-u "test@liferay.com:learn"