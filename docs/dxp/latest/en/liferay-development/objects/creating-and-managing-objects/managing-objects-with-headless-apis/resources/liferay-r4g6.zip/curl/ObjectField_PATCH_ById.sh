curl \
	"http://localhost:8080/o/object-admin/v1.0/object-fields/${1}" \
	--data-raw '
		{
			"label": {
				"en_US": "Baker"
			},
			"name": "baker"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"