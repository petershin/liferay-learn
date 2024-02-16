curl \
	-H "Content-Type: application/json" \
	-X "POST" "http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}/postal-addresses" \
	-d "{\"addressCountry\": \"United States\", \"addressLocality\": \"Diamond Bar\", \"addressRegion\": \"California\", \"addressType\": \"shipping\", \"name\": \"Able Address\", \"postalCode\": \"12345\", \"primary\": false, \"streetAddressLine1\": \"123 Foo St\", \"streetAddressLine2\": \"\", \"streetAddressLine3\": \"\"}" \
	-u "test@liferay.com:learn"