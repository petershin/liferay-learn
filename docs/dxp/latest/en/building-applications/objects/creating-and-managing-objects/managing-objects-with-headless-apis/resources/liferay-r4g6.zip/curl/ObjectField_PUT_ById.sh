curl \
	"http://localhost:8080/o/object-admin/v1.0/object-fields/${1}" \
	--data-raw '
		{
			"businessType": "Text",
			"label": {
				"en_US": "Charlie"
			},
			"name": "charlie",
			"required": false
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"