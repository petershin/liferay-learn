curl \
	 -H "Content-Type: application/json" \
	 -X "POST" \
	 "http://localhost:8080/o/headless-commerce-admin-order/v1.0/order-types" \
	 -d "{\"name\": {\"en_US\": \"Foo\"}}" \
	 -u "test@liferay.com:learn"