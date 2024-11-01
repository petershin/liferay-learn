curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-content-folders/${1}/structured-contents" \
	--data-raw '
		{
			"contentFields": [
				{
				"contentFieldValue": {
					"data": "Foo"
				},
				"name": "Content"
				}
			],
			"contentStructureId": "'"${2}"'",
			"title": "Charlie Article"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"