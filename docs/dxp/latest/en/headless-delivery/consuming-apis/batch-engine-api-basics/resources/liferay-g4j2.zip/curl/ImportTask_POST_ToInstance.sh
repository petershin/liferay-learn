curl \
	"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}" \
	--data-raw '
		[
			{
				"name": "Able",
				"type": "business"
			},
			{
				"name": "Baker",
				"type": "guest"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"