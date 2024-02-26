curl \
	"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}" \
	--data-raw '
		[
			{
				"id": 1234
			},
			{
				"id": 5678
			}
		]' \
	--header "Content-Type: application/json" \
	--request "DELETE" \
	--user "test@liferay.com:learn"