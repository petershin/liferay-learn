curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalogs" \
	-d "{\"currencyCode\": \"USD\", \"defaultLanguageId\": \"en_US\", \"name\": \"Able\"}" \
	-u "test@liferay.com:learn"