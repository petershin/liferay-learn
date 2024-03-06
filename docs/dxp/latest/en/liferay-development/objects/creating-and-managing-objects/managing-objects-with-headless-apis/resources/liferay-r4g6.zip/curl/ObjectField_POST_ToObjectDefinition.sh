curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/${1}/object-fields" \
	--data-raw '
		{
			"businessType": "Text",
			"label": {
				"en_US": "Able"
			},
			"name": "able",
			"required": false
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"