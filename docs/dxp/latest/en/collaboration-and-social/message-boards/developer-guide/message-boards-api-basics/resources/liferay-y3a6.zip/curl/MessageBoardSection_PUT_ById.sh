curl \
	"http://localhost:8080/o/headless-delivery/v1.0/message-board-sections/${1}" \
	--data-raw '
		{
			"description": "Goo",
			"title": "Baker Section"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"