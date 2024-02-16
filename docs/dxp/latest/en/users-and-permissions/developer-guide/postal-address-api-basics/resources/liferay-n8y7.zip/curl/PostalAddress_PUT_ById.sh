curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/headless-admin-user/v1.0/postal-addresses/${1}" \
	-d "{\"addressCountry\": \"United States\", \"addressLocality\": \"Diamond Bar\", \"addressRegion\": \"California\", \"addressType\": \"shipping\", \"name\": \"Baker Address\", \"postalCode\": \"12345\", \"primary\": false, \"streetAddressLine1\": \"789 Goo Rd\", \"streetAddressLine2\": \"\", \"streetAddressLine3\": \"\"}" \
	-u "test@liferay.com:learn"