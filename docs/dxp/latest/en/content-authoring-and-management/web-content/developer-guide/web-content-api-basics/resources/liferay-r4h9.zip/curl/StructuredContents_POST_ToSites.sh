curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-contents" \
	--data-raw '
		{
			"contentFields": [
				{
				"contentFieldValue": {
					"data": "Goo"
				},
				"name": "Content"
				}
			],
			"contentStructureId": "'"${2}"'",
			"title": "Goo Article"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"