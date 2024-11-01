curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-contents" \
	--data-raw '
		{
			"contentFields": [
				{
					"contentFieldValue": {
						"data": "This text describes Foo."
					},
					"name": "TextReference"
				},
				{
					"contentFieldValue": {
						"image": {
							"description": "This text describes the image for Foo.",
							"id": "'"${2}"'"
						}
					},
					"name": "ImageReference"
				},
				{
					"contentFieldValue": {
						"data": "2021-08-30T00:00:00Z"
					},
					"name": "DateReference"
				},
				{
					"contentFieldValue": {
						"data": "Foo"
					},
					"name": "SingleSelectionReference"
				}
			],
			"contentStructureId": "'"${3}"'",
			"title": "Able"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"