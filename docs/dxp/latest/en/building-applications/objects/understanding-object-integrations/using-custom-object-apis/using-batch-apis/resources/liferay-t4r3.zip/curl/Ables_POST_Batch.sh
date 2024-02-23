curl \
	"http://localhost:8080/o/c/ables/batch" \
	--header "Content-Type: application/json" \
	--request "POST" \
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
	--user "test@liferay.com:learn"