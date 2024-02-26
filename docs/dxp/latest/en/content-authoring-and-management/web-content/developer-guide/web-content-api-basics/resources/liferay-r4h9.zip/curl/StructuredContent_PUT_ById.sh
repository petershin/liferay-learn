curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-contents/${1}" \
	--data-raw '
		{
			"contentFields": [
				{
				"contentFieldValue": {
					"data": "<p>Goo</p>"
				},
				"name": "content"
				}
			],
			"contentStructureId": "${2}",
			"title": "Baker Article"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"