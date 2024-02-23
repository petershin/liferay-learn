curl \
	"http://localhost:8080/o/headless-delivery/v1.0/message-board-sections/${1}/message-board-threads" \
	--data-raw '
		{
			"articleBody": "Foo",
			"headline": "Baker Thread"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"