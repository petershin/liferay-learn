curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/message-board-sections" \
	--data-raw '
		{
			"description": "Foo",
			"title": "Able Section"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"