curl \
	"http://localhost:8080/o/headless-delivery/v1.0/message-board-threads/${1}" \
	--data-raw '
		{
			"articleBody": "Goo",
			"headline": "Charlie Thread"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"