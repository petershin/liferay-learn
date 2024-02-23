curl \
	"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/${1}" \
	--data-raw '
		{
		"limitationType": "unlimited",
		"target": "subtotal",
		"title": "Bar"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"