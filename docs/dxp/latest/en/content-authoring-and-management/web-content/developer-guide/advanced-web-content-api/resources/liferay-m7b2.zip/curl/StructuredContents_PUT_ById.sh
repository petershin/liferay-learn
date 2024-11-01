curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-contents/${1}" \
	--data-raw '
		{
			"contentFields": [
				{
					"contentFieldValue": {
						"data": "This text describes Goo."
					},
					"name": "TextReference"
				},
				{
					"contentFieldValue": {
						"image": {
							"description": "This text describes the image for Goo.",
							"id": "'"${2}"'"
						}
					},
					"name": "ImageReference"
				},
				{
					"contentFieldValue": {
						"data": "2021-10-30T00:00:00Z"
					},
					"name": "DateReference"
				},
				{
					"contentFieldValue": {
						"data": "Goo"
					},
					"name": "SingleSelectionReference"
				}
			],
			"contentStructureId": "'"${3}"'",
			"title": "Baker"
		}'\
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"