curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/postal-addresses/${1}" \
	--data-raw '
		{
			"addressCountry": "United States",
			"addressLocality": "Diamond Bar",
			"addressRegion": "California",
			"addressType": "shipping",
			"name": "Baker Address",
			"postalCode": "12345",
			"primary": false,
			"streetAddressLine1": "789 Goo Rd",
			"streetAddressLine2": "",
			"streetAddressLine3": ""
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"