curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products" \
	-d "{\"active\": true, \"catalogId\": \"${1}\", \"name\": {\"en_US\": \"Foo\"}, \"productType\": \"simple\"}" \
	-u "test@liferay.com:learn"