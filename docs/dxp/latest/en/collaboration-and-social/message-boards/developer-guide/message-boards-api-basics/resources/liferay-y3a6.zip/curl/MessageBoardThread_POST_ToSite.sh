curl \
	"http://localhost:8080/o/headless-delivery//v1.0/sites/${1}/message-board-threads" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"articleBody\": \"Foo\", \"headline\": \"Able Thread\"}" \
	-u "test@liferay.com:learn"