curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/options/${1}" \
	--data-raw '
		{
			"fieldType": "radio",
			"key": "bar",
			"name": {
				"en_US": "Bar"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"