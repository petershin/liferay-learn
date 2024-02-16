curl \
	 -H "Content-Type: application/json" \
	 -X "PATCH" \
	 "http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders/${1}" \
	 -d "{\"externalReferenceCode\": \"Able\"}" \
	 -u "test@liferay.com:learn"