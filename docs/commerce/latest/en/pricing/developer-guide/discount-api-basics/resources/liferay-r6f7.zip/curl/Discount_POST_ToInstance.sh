curl \
	 -H "Content-Type: application/json" \
	 -X "POST" \
	 "http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts" \
	 -d "{\"level\": \"L1\", \"limitationType\": \"unlimited\", \"target\": \"products\", \"title\": \"Foo\", \"usePercentage\": true}" \
	 -u "test@liferay.com:learn"