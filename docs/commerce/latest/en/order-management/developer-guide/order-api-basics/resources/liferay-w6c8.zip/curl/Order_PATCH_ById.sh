curl \
	"http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders/${1}" \
	--data-raw '
		{
			"externalReferenceCode": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"