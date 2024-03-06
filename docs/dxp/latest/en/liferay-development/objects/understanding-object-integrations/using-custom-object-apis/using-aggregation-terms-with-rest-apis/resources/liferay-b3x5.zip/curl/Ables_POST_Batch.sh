curl \
	"http://localhost:8080/o/c/ables/batch" \
	--data-raw '
		[
			{
				"name": "Able 1",
				"description": "Foo"
			},
			{
				"name": "Able 2",
				"description": "Bar"
			},
			{
				"name": "Able 3",
				"description": "Goo"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"