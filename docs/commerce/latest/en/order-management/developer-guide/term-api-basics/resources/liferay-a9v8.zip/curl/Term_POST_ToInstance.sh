curl \
	"http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"label\": {\"en_US\": \"Foo\"}, \"name\": \"foo\", \"priority\": 0, \"type\": \"payment-terms\"}" \
	-u "test@liferay.com:learn"