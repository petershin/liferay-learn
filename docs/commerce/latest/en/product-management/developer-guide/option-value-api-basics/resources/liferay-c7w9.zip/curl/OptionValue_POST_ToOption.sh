curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/${1}/optionValues" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"key\": \"able\", \"name\": {\"en_US\": \"Able\"}}" \
	-u "test@liferay.com:learn"