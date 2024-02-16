curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/message-board-sections" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"description\": \"Foo\", \"title\": \"Able Section\"}" \
	-u "test@liferay.com:learn"