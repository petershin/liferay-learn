curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/specifications/${1}" \
	--data-raw '
		{
			"key": "bar",
			"title": {
				"en_US": "Bar"
			}
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"