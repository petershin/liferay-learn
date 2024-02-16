curl \
	"http://localhost:8080/o/headless-commerce-admin-order/v1.0/order-types" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"name\": {\"en_US\": \"Foo\"}}" \
	-u "test@liferay.com:learn"