curl \
	"http://localhost:8080/o/headless-delivery/v1.0/message-board-messages/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "{\"articleBody\": \"Goo\", \"headline\": \"Baker Message\"}" \
	-u "test@liferay.com:learn"