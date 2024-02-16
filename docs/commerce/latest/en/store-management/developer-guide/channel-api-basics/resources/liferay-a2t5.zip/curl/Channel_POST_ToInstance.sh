curl \
	 -H "Content-Type: application/json" \
	 -X "POST" \
	 "http://localhost:8080/o/headless-commerce-admin-channel/v1.0/channels" \
	 -d "{\"currencyCode\": \"USD\", \"name\": \"Foo\", \"type\": \"site\"}" \
	 -u "test@liferay.com:learn"