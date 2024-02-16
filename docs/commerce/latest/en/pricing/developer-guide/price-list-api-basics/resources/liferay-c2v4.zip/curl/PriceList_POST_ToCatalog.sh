curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists" \
	-d "{\"catalogId\": ${1}, \"currencyCode\": \"USD\", \"name\": \"Able\", \"type\": \"price-list\"}" \
	-u "test@liferay.com:learn"