curl \
	 -H "Content-Type: application/json" \
	 -X "PATCH" \
	 "http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses/${1}" \
	 -d "{\"name\": {\"en_US\": \"Bar\"}}" \
	 -u "test@liferay.com:learn"