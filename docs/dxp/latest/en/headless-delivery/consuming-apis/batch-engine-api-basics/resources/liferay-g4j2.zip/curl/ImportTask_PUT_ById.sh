curl \
	"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}" \
	--data-raw '
		[
			{
				"id": 1234,
				"name": "Bar",
				"type": "business"
			},
			{
				"id": 5678,
				"name": "Goo",
				"type": "guest"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"