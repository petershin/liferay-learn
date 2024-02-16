curl \
	 -H "Content-Type: application/json" \
	 -X "POST" \
	 "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses" \
	 -d "{\"active\": false, \"name\": {\"en_US\": \"Foo\"}}" \
	 -u "test@liferay.com:learn"