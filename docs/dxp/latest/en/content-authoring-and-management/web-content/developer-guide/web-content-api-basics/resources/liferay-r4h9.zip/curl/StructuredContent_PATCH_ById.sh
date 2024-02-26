curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-contents/${1}" \
	--data-raw '
		{
			"contentFields": [
				{
				"contentFieldValue": {
					"data": "<p>Bar</p>"
				},
				"name": "content"
				}
			]
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"