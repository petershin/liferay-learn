curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-contents" \
	--data-raw '
		{
			"contentFields": [
				{
				"contentFieldValue": {
					"data": "<p>Foo</p>"
				},
				"name": "content"
				}
			],
			"contentStructureId": "${2}",
			"title": "Able Article"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"