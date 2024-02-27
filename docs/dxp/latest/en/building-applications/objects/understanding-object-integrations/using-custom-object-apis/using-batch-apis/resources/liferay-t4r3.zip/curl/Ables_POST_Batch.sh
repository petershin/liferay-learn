curl \
	"http://localhost:8080/o/c/ables/batch" \
	--data-raw '
		[
			{
				"name": "Able 1"
			},
			{
				"name": "Able 2"
			},
			{
				"name": "Able 3"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"