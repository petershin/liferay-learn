curl \
	"http://localhost:8080/o/headless-delivery/v1.0/message-board-threads/${1}/message-board-messages" \
	--data-raw '
		{
			"articleBody": "Foo",
			"headline": "Able Message"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"