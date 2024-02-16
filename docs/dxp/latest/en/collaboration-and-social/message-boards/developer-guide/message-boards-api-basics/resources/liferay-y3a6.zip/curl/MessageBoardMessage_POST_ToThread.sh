curl \
	"http://localhost:8080/o/headless-delivery/v1.0/message-board-threads/${1}/message-board-messages" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"articleBody\": \"Foo\", \"headline\": \"Able Message\"}" \
	-u "test@liferay.com:learn"