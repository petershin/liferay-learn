curl \
	"http://localhost:8080/o/headless-delivery//v1.0/sites/${1}/message-board-threads" \
	--data-raw '
		{
			"articleBody": "Foo",
			"headline": "Able Thread"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"