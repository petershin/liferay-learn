curl \
	"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts" \
	--data-raw '
		{
			"level": "L1",
			"limitationType": "unlimited",
			"target": "products",
			"title": "Foo",
			"usePercentage": true
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"